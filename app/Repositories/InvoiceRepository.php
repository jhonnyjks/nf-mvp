<?php

namespace App\Repositories;

use App\Models\Invoice;
use App\Repositories\BaseRepository;
use Illuminate\Support\Facades\Storage;

/**
 * Class InvoiceRepository
 * @package App\Repositories
 * @version August 29, 2025, 4:06 pm -03
 */

class InvoiceRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'description',
        'categories',
        'resume',
        'user_id'
    ];

    /**
     * Return searchable fields
     *
     * @return array
     */
    public function getFieldsSearchable()
    {
        return $this->fieldSearchable;
    }

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Invoice::class;
    }

    public function saveFile($data)
    {
        try {
            $binary = base64_decode($data['file'], true);
            if ($binary === false) {
                return response()->json(['message' => 'Invalid base64 file'], 422);
            }

            $name = pathinfo($data['filename'], PATHINFO_FILENAME);
            $ext  = pathinfo($data['filename'], PATHINFO_EXTENSION) ?: 'bin';
            $safe = preg_replace('/[^A-Za-z0-9_-]/', '-', $name);
            $path = "invoices/" . time() . "-{$safe}.{$ext}";

            Storage::disk('public')->put($path, $binary);

            $ocrContent = $this->getOCR(storage_path('app/public/' . $path));
            $ocrContent = $this->cleanHTTPHeaders($ocrContent);

            if (empty($ocrContent)) {
                return null;
            }


            // se quiser vincular ao invoice no banco:
            if (file_exists(storage_path('app/public/' . $path))) {
                return Invoice::create([
                    'description' => $ocrContent,
                    'user_id' => auth()->id(),
                    'resume' => $path,
                    'categories' => 'Uncategorized'
                ]);
            }
        } catch (\Exception $e) {
            throw $e;
        }
    }

    public function getOCR($fullPath)
    {
        $pdfOutputDir = storage_path('app/pdf_pages');
        $txtOutputDir = storage_path('app/txt_pages');
        $imgOutputDir = storage_path('app/img_pages');

        // Identifica o tipo de arquivo
        $fileInfo = pathinfo($fullPath);
        $extension = strtolower($fileInfo['extension']);

        $this->createDirectories([$pdfOutputDir, $txtOutputDir, $imgOutputDir]);

        if ($extension === 'pdf') {
            // Arquivo é um PDF, processa as páginas
            $pagePaths = $this->splitPdfIntoPages($fullPath, $pdfOutputDir);
        } elseif (in_array($extension, ['jpg', 'jpeg', 'png'])) {
            // Arquivo é uma imagem, move para o diretório apropriado
            $imagePath = $imgOutputDir . '/' . $fileInfo['basename'];
            copy($fullPath, $imagePath); // Copia a imagem para o diretório
            $normalizedImagePath = $this->normalizeFileName($imagePath); // Normaliza o nome
            $pagePaths = [$normalizedImagePath]; // Atualiza com o caminho normalizado
        } else {
            // Tipo de arquivo não suportado
            throw new \InvalidArgumentException('Formato de arquivo não suportado.');
        }

        // Processa as páginas (PDF ou imagem) com OCR
        $this->processPagesWithOCRToRTF($pagePaths, $txtOutputDir);

        // Combina o conteúdo OCR em um arquivo de texto
        $combinedContent = $this->combineTxtFiles($txtOutputDir);

        // Limpa os diretórios após o processamento
        $this->clearDirectory($pdfOutputDir);
        $this->clearDirectory($txtOutputDir);
        $this->clearDirectory($imgOutputDir);

        return response($combinedContent, 200)
            ->header('Content-Type', 'text/plain');
    }

    /**
     * Cria os diretórios necessários caso não existam.
     */
    private function createDirectories(array $directories)
    {
        foreach ($directories as $directory) {
            if (!file_exists($directory)) {
                mkdir($directory, 0777, true);
            }
        }
    }

    /**
     * Divide o PDF em páginas individuais e retorna os caminhos das páginas.
     */
    private function splitPdfIntoPages(string $pdfPath, string $outputDir): array
    {
        $pdf = new Fpdi();
        $pageCount = $pdf->setSourceFile($pdfPath);
        $pagePaths = [];

        for ($i = 1; $i <= $pageCount; $i++) {
            $newPdf = new Fpdi();
            $newPdf->AddPage();
            $newPdf->setSourceFile($pdfPath);
            $newPdf->useTemplate($newPdf->importPage($i));
            $outputPath = $outputDir . "/page_$i.pdf";
            $newPdf->Output($outputPath, 'F');
            $pagePaths[] = $outputPath;
        }

        return $pagePaths;
    }

    /**
     * Normaliza o nome do arquivo para remover espaços, acentos e caracteres especiais.
     */
    private function normalizeFileName(string $filePath): string
    {
        $pathInfo = pathinfo($filePath);
        $normalizedFileName = preg_replace('/[^\w\-\.]/u', '-', $pathInfo['basename']);
        $normalizedFilePath = $pathInfo['dirname'] . '/' . $normalizedFileName;

        if ($filePath !== $normalizedFilePath) {
            // Renomeia o arquivo no sistema
            rename($filePath, $normalizedFilePath);
        }

        return $normalizedFilePath;
    }

    /**
     * Processa cada página (PDF ou imagem) com OCR e salva o conteúdo PDF.
     */
    private function processPagesWithOCRToRTF(array $pagePaths, string $txtOutputDir)
    {
        foreach ($pagePaths as $index => $pagePath) {
            try {
                // Normaliza o caminho do arquivo antes de processar
                $pagePath = $this->normalizeFileName($pagePath);
                $txtFilePath = $txtOutputDir . "/page_" . ($index + 1) . ".txt";

                $txt = (new \thiagoalessio\TesseractOCR\TesseractOCR($pagePath))
                    ->lang('eng', 'por')
                    ->run();

                file_put_contents($txtFilePath, $txt);
            } catch (\Exception $e) {
                throw new \RuntimeException('Erro ao processar OCR: ' . $e->getMessage());
                $this->clearDirectory($pdfOutputDir);
                $this->clearDirectory($txtOutputDir);
                $this->clearDirectory($imgOutputDir);
            }
        }
    }

    /**
     * Combina os arquivos .txt em ordem e remove os cabeçalhos desnecessários.
     */
    private function combineTxtFiles(string $txtOutputDir): string
    {
        $txtFiles = glob($txtOutputDir . '/*.txt');

        // Ordena os arquivos com base no número no nome
        usort($txtFiles, function ($a, $b) {
            $numA = (int)preg_replace('/\D/', '', basename($a)); // Extrai o número do nome
            $numB = (int)preg_replace('/\D/', '', basename($b));
            return $numA <=> $numB; // Ordena numericamente
        });

        // Concatena os arquivos em um só conteúdo
        $combinedContent = '';
        foreach ($txtFiles as $filePath) {
            $combinedContent .= file_get_contents($filePath) . "\n";
        }

        return $combinedContent;
    }

    /**
     * Remove todos os arquivos dentro de um diretório.
     */
    private function clearDirectory(string $directory)
    {
        $files = glob($directory . '/*');

        foreach ($files as $file) {
            if (is_file($file)) {
                unlink($file);
            }
        }
    }

    /**
     * Remove os cabeçalhos HTTP de um texto.
     */
    private function cleanHTTPHeaders($text)
    {
        return preg_replace('/HTTP.*?GMT\s+/s', '', $text);
    }
}

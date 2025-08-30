<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreateInvoiceAPIRequest;
use App\Http\Requests\API\UpdateInvoiceAPIRequest;
use App\Models\Invoice;
use App\Repositories\InvoiceRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\AppBaseController;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Response;

/**
 * Class InvoiceController
 * @package App\Http\Controllers\API
 */

class InvoiceAPIController extends AppBaseController
{
    /** @var  InvoiceRepository */
    private $invoiceRepository;

    public function __construct(InvoiceRepository $invoiceRepo)
    {
        $this->invoiceRepository = $invoiceRepo;
    }

    /**
     * @param Request $request
     * @return Response
     *
     * @SWG\Get(
     *      path="/invoices",
     *      summary="Get a listing of the Invoices.",
     *      tags={"Invoice"},
     *      description="Get all Invoices",
     *      produces={"application/json"},
     *      @SWG\Response(
     *          response=200,
     *          description="successful operation",
     *          @SWG\Schema(
     *              type="object",
     *              @SWG\Property(
     *                  property="success",
     *                  type="boolean"
     *              ),
     *              @SWG\Property(
     *                  property="data",
     *                  type="array",
     *                  @SWG\Items(ref="#/definitions/Invoice")
     *              ),
     *              @SWG\Property(
     *                  property="message",
     *                  type="string"
     *              )
     *          )
     *      )
     * )
     */
    public function index(Request $request)
    {
        $this->invoiceRepository->pushCriteria(new RequestCriteria($request));
        $this->invoiceRepository->pushCriteria(new LimitOffsetCriteria($request));
        $invoices = $this->invoiceRepository->all();

        return $this->sendResponse($invoices->toArray(), 'Invoices retrieved successfully');
    }

    /**
     * @param CreateInvoiceAPIRequest $request
     * @return Response
     *
     * @SWG\Post(
     *      path="/invoices",
     *      summary="Store a newly created Invoice in storage",
     *      tags={"Invoice"},
     *      description="Store Invoice",
     *      produces={"application/json"},
     *      @SWG\Parameter(
     *          name="body",
     *          in="body",
     *          description="Invoice that should be stored",
     *          required=false,
     *          @SWG\Schema(ref="#/definitions/Invoice")
     *      ),
     *      @SWG\Response(
     *          response=200,
     *          description="successful operation",
     *          @SWG\Schema(
     *              type="object",
     *              @SWG\Property(
     *                  property="success",
     *                  type="boolean"
     *              ),
     *              @SWG\Property(
     *                  property="data",
     *                  ref="#/definitions/Invoice"
     *              ),
     *              @SWG\Property(
     *                  property="message",
     *                  type="string"
     *              )
     *          )
     *      )
     * )
     */
    public function store(CreateInvoiceAPIRequest $request)
    {
        $input = $request->all();

        $invoice = null;

        if (sizeof($input) == 1 && !empty($input['description'])) {
            $invoice = $this->invoiceRepository->saveFile($input['description']);
        } else {
            $invoice = $this->invoiceRepository->create($input);
        }

        if (empty($invoice)) {
            return $this->sendError('Invoice could not be created from the provided file');
        }

        return $this->sendResponse($invoice->toArray(), 'Invoice saved successfully');
    }

    /**
     * @param int $id
     * @return Response
     *
     * @SWG\Get(
     *      path="/invoices/{id}",
     *      summary="Display the specified Invoice",
     *      tags={"Invoice"},
     *      description="Get Invoice",
     *      produces={"application/json"},
     *      @SWG\Parameter(
     *          name="id",
     *          description="id of Invoice",
     *          type="integer",
     *          required=true,
     *          in="path"
     *      ),
     *      @SWG\Response(
     *          response=200,
     *          description="successful operation",
     *          @SWG\Schema(
     *              type="object",
     *              @SWG\Property(
     *                  property="success",
     *                  type="boolean"
     *              ),
     *              @SWG\Property(
     *                  property="data",
     *                  ref="#/definitions/Invoice"
     *              ),
     *              @SWG\Property(
     *                  property="message",
     *                  type="string"
     *              )
     *          )
     *      )
     * )
     */
    public function show($id)
    {
        /** @var Invoice $invoice */
        $invoice = $this->invoiceRepository->find($id);

        if (empty($invoice)) {
            return $this->sendError('Invoice not found');
        }

        return $this->sendResponse($invoice->toArray(), 'Invoice retrieved successfully');
    }

    /**
     * @param int $id
     * @param UpdateInvoiceAPIRequest $request
     * @return Response
     *
     * @SWG\Put(
     *      path="/invoices/{id}",
     *      summary="Update the specified Invoice in storage",
     *      tags={"Invoice"},
     *      description="Update Invoice",
     *      produces={"application/json"},
     *      @SWG\Parameter(
     *          name="id",
     *          description="id of Invoice",
     *          type="integer",
     *          required=true,
     *          in="path"
     *      ),
     *      @SWG\Parameter(
     *          name="body",
     *          in="body",
     *          description="Invoice that should be updated",
     *          required=false,
     *          @SWG\Schema(ref="#/definitions/Invoice")
     *      ),
     *      @SWG\Response(
     *          response=200,
     *          description="successful operation",
     *          @SWG\Schema(
     *              type="object",
     *              @SWG\Property(
     *                  property="success",
     *                  type="boolean"
     *              ),
     *              @SWG\Property(
     *                  property="data",
     *                  ref="#/definitions/Invoice"
     *              ),
     *              @SWG\Property(
     *                  property="message",
     *                  type="string"
     *              )
     *          )
     *      )
     * )
     */
    public function update($id, UpdateInvoiceAPIRequest $request)
    {
        $input = $request->all();

        /** @var Invoice $invoice */
        $invoice = $this->invoiceRepository->find($id);

        if (empty($invoice)) {
            return $this->sendError('Invoice not found');
        }

        $invoice = $this->invoiceRepository->update($input, $id);

        return $this->sendResponse($invoice->toArray(), 'Invoice updated successfully');
    }

    /**
     * @param int $id
     * @return Response
     *
     * @SWG\Delete(
     *      path="/invoices/{id}",
     *      summary="Remove the specified Invoice from storage",
     *      tags={"Invoice"},
     *      description="Delete Invoice",
     *      produces={"application/json"},
     *      @SWG\Parameter(
     *          name="id",
     *          description="id of Invoice",
     *          type="integer",
     *          required=true,
     *          in="path"
     *      ),
     *      @SWG\Response(
     *          response=200,
     *          description="successful operation",
     *          @SWG\Schema(
     *              type="object",
     *              @SWG\Property(
     *                  property="success",
     *                  type="boolean"
     *              ),
     *              @SWG\Property(
     *                  property="data",
     *                  type="string"
     *              ),
     *              @SWG\Property(
     *                  property="message",
     *                  type="string"
     *              )
     *          )
     *      )
     * )
     */
    public function destroy($id)
    {
        /** @var Invoice $invoice */
        $invoice = $this->invoiceRepository->find($id);

        if (empty($invoice)) {
            return $this->sendError('Invoice not found');
        }

        $invoice->delete();

        return $this->sendResponse([], 'Invoice deleted successfully');
    }
}

<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Http\Client\RequestException;

class N8nMailer
{
    public function send(array $payload): void
    {
        $url = rtrim(config('services.n8n.url'), '/') . '/webhook/send-email';

        $response = Http::timeout(10)
            ->withHeaders(['X-Webhook-Token' => config('services.n8n.token')])
            ->asJson()
            ->post($url, $payload);

        if ($response->failed()) {
            throw new RequestException($response);
        }
    }
}

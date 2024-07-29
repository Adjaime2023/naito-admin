<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class ContactController extends Controller
{
    public function submitContactForm(Request $request)
    {
        // Validação e processamento do formulário
        $details = $request->validate([
            'fullName' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'phone' => 'required|string|max:20',
            'message' => 'required|string|max:1000',
        ]);

        // Envio do email diretamente
        Mail::raw($details['message'], function ($message) use ($details) {
            $message->to('adjnaito@gmail.com')
                    ->subject('Contato do site')
                    ->from($details['email'], $details['fullName']);
        });

        // Retornando uma resposta válida do Inertia com uma mensagem de sucesso
        return back()->with(['successMessage' => 'Email enviado com sucesso!']);
    }
}

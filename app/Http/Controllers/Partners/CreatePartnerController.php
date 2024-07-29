<?php

namespace App\Http\Controllers\Partners;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Partner;
use Inertia\Inertia;
use Illuminate\Support\Facades\Log;

class CreatePartnerController extends Controller
{


    public function create()
    {


        return Inertia::render('Ecommerce/Admin/Partners/Create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'contact' => 'required|string',
            'email' => 'nullable|string|email|max:255|unique:partners,email',
            'whatsapp' => 'nullable|string',
            'phone' => 'nullable|string',
            'website' => 'nullable|string',
            'facebook' => 'nullable|string',
            'x' => 'nullable|string',
            'tiktok' => 'nullable|string',
            'instagram' => 'nullable|string',
            'cep' => 'nullable|string',
            'city' => 'nullable|string',
            'uf' => 'nullable|string|max:2',
            'address' => 'nullable|string',
            'number' => 'nullable|string',
            'complement' => 'nullable|string',
            'neighborhood' => 'nullable|string',
            'latitude' => 'nullable|string',
            'longitude' => 'nullable|string',
            'nivel_zoon' => 'nullable|string',
        ]);

        try {

            $partner = Partner::create([
                'name' => $validated['name'],
                'contact' => $validated['contact'],
                'email' => $validated['email'],
                'whatsapp' => $validated['whatsapp'],
                'phone' => $validated['phone'],
                'website' => $validated['website'],
                'facebook' =>$validated['facebook'],
                'x' => $validated['x'],
                'tiktok' => $validated['tiktok'],
                'cep' => $validated['cep'],
                'city' => $validated['city'],
                'uf' => $validated['uf'],
                'address' => $validated['address'],
                'number' => $validated['number'],
                'complement' => $validated['complement'],
                'neighborhood' => $validated['neighborhood'],
                'latitude' =>  $validated['latitude'],
                'longitude' =>  $validated['longitude'],
                'nivel_zoon' => $validated['nivel_zoon'],
            ]);


            Log::debug('Parceiro criado:', $partner->toArray()); // Converter para array


            return redirect()->route('partner.edit', $partner->id)
                ->with('flash.banner', 'Parceiro criado com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            Log::error('Erro ao salvar Parceiro: ' . $e->getMessage());
            return redirect()->back()
                ->with('danger', 'Erro ao criar o Parceiro: ' . $e->getMessage());
        }
    }
}

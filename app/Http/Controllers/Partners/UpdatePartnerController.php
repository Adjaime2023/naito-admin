<?php

namespace App\Http\Controllers\Partners;

use App\Http\Controllers\Controller;
use App\Models\Partner;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class UpdatePartnerController extends Controller
{
    public function edit($id)
    {
        $partner = Partner::findOrFail($id);
        return Inertia::render('Ecommerce/Admin/Partners/Update', ['partner' => $partner]);
    }

    public function update(Request $request, $id)
    {

        $partner = Partner::findOrFail($id);
        
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'contact' => 'required|string',
            'email' => 'nullable|string|email|max:255|unique:partners,email,' . $partner->id,
            'whatsapp' => 'nullable|string',
            'phone' => 'nullable|string',
            'website' => 'nullable|string',
            'facebook' => 'nullable|string',
            'x' => 'nullable|string',
            'tiktok' => 'nullable|string',
            'instagram' => 'nullable|string',
            'cep' => 'nullable|string',
            'city' => 'nullable|string',
            'uf' => 'required|string|max:2',
            'address' => 'nullable|string',
            'number' => 'nullable|string',
            'complement' => 'nullable|string',
            'neighborhood' => 'nullable|string',
            'latitude' => 'nullable|string',
            'longitude' => 'nullable|string',
            'nivel_zoon' => 'nullable|string',
        ]);

        try {
            $partner = Partner::findOrFail($id);
            $partner->update($validatedData);

            return Redirect::route('partner.edit', $partner->id)
                ->with('flash.banner', 'Parceiro atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Empresa: ' . $e->getMessage());
        }
    }

    public function updateImageFavicon(Request $request, $id)
    {
        $validated = $request->validate([
            'favicon' => 'required|image|mimes:jpeg,png,jpg,gif,svg,ico|max:2048',
        ]);

        try {
            $partner = Partner::findOrFail($id);

            if ($request->hasFile('favicon')) {
                $image = $request->file('favicon');
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $partner->name));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . 'favicon' . '_' . date('YmdHi') . '.' . $extension;
                $path = $image->storeAs('partner/' . $partner->id, $filename, 'public');

                if ($partner->logo_favicon && $partner->favicon !== 'images/favicon_naito.png') {
                    Storage::disk('public')->delete($partner->favicon);
                }

                $partner->favicon = $path;
                $partner->save();
            }

            return Redirect::route('partner.edit', $partner->id)
                ->with('flash.banner', 'Imagem da Favicon atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da Favicon: ' . $e->getMessage());
        }
    }

    public function updateImageLogoLight(Request $request, $id)
    {
        $validated = $request->validate([
            'logo_light' => 'required|image|mimes:jpeg,png,jpg,gif,svg,ico|max:2048',
        ]);

        try {
            $partner = Partner::findOrFail($id);

            if ($request->hasFile('logo_light')) {
                $image = $request->file('logo_light');
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $partner->name));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . 'logo_light' . '_' . date('YmdHi') . '.' . $extension;
                $path = $image->storeAs('partner/' . $partner->id, $filename, 'public');

                if ($partner->logo_light && $partner->logo_light !== 'images/default.png') {
                    Storage::disk('public')->delete($partner->logo_light);
                }

                $partner->logo_light = $path;
                $partner->save();
            }

            return Redirect::route('partner.edit', $partner->id)
                ->with('flash.banner', 'Imagem da Logo Light atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da Logo Light: ' . $e->getMessage());
        }
    }

    public function updateImageLogoDark(Request $request, $id)
    {
        $validated = $request->validate([
            'logo_dark' => 'required|image|mimes:jpeg,png,jpg,gif,svg,ico|max:2048',
        ]);

        try {
            $partner = Partner::findOrFail($id);

            if ($request->hasFile('logo_dark')) {
                $image = $request->file('logo_dark');
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $partner->name));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . 'logo_dark' . '_' . date('YmdHi') . '.' . $extension;
                $path = $image->storeAs('partner/' . $partner->id, $filename, 'public');


                // Verifica se a imagem atual não é a default.png antes de deletá-la
            if ($partner->logo_dark && $partner->logo_dark !== 'images/default.png') {
                Storage::disk('public')->delete($partner->logo_dark);
            }

                $partner->logo_dark = $path;
                $partner->save();
            }

            return Redirect::route('partner.edit', $partner->id)
                ->with('flash.banner', 'Imagem da Logo Dark atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da Logo Dark: ' . $e->getMessage());
        }
    }
}

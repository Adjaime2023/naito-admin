<?php

namespace App\Http\Controllers\Products\ProductClassification;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Products\Brand;
use Inertia\Inertia;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Redirect;

class UpdateBrandController extends Controller
{
    public function edit($id)
    {
        $brand = Brand::findOrFail($id);
        return Inertia::render('Ecommerce/Admin/ProductClassification/Brands/Update', [
            'brand' => $brand,
        ]);
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'discontinued' => 'required|boolean',
            'deleted' => 'required|boolean',
            'action_user' => 'nullable|string',
        ]);

        try {
            $brand = Brand::findOrFail($id);
            $brand->update($validated);

            return Redirect::route('brand.edit', $brand->id)
                ->with('flash.banner', 'Marca atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Marca: ' . $e->getMessage());
        }
    }

    public function updateImage(Request $request, $id)
    {
        $validated = $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        try {
            $brand = Brand::findOrFail($id);

            // Se houver uma nova imagem, processa o upload
            if ($request->hasFile('image')) {
                $image = $request->file('image');

                // Remove espaços e caracteres indesejados do nome da Marca
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $brand->name));

                // Obtém a extensão do arquivo original
                $extension = $image->getClientOriginalExtension();

                // Cria o nome do arquivo usando o nome sanitizado da Marca
                $filename = $sanitizedName . '_' . date('YmdHi') . '.' . $extension;

                // Salva o arquivo no sistema de arquivos configurado (usando o disco 'public' por padrão)
                $path = $image->storeAs('brands/' . $brand->id, $filename, 'public');

                // Remove a imagem antiga se existir
                if ($brand->image && $brand->image !== 'images/default.png') {
                    Storage::disk('public')->delete($brand->image);
                }

                // Atualiza o caminho da imagem na Marca
                $brand->image = $path;
                $brand->save();
            }

            return Redirect::route('brand.edit', $brand->id)
                ->with('flash.banner', 'Imagem da Marca atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da Marca: ' . $e->getMessage());
        }
    }
}

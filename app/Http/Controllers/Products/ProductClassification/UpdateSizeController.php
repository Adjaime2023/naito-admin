<?php

namespace App\Http\Controllers\Products\ProductClassification;

use App\Http\Controllers\Controller;
use App\Models\Products\Product;
use App\Models\Products\Size;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;
use Illuminate\Support\Facades\Storage;

class UpdateSizeController extends Controller
{
    public function edit($id)
    {

        $size = Size::findOrFail($id);
        $products = Product::all();

        return Inertia::render('Ecommerce/Admin/ProductClassification/Sizes/Update', [
            'size' => $size,
            'products' => $products,
        ]);
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'product_id' => 'required|exists:subcategories,id',
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'discontinued' => 'required|boolean',
            'deleted' => 'required|boolean',
            'action_user' => 'nullable|string',
        ]);

        try {
            $size = Size::findOrFail($id);
            $size->update($validated);

            return Redirect::route('size.edit', $size->id)
                ->with('flash.banner', 'Tamanho atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Tamanhos: ' . $e->getMessage());
        }
    }

    public function updateImage(Request $request, $id)
    {
        $validated = $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        try {
            $size = Size::findOrFail($id);

            // Se houver uma nova imagem, processa o upload
            if ($request->hasFile('image')) {
                $image = $request->file('image');

                // Remove espaços e caracteres indesejados do nome da Tamanhos
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $size->name));

                // Obtém a extensão do arquivo original
                $extension = $image->getClientOriginalExtension();

                // Cria o nome do arquivo usando o nome sanitizado da Tamanhos
                $filename = $sanitizedName . '_' . date('YmdHi') . '.' . $extension;

                // Salva o arquivo no sistema de arquivos configurado (usando o disco 'public' por padrão)
                $path = $image->storeAs('subcategories/' . $size->id, $filename, 'public');

                // Remove a imagem antiga se existir
                if ($size->image && $size->image !== 'images/default.png') {
                    Storage::disk('public')->delete($size->image);
                }

                // Atualiza o caminho da imagem na Tamanhos
                $size->image = $path;
                $size->save();
            }

            return Redirect::route('size.edit', $size->id)
                ->with('flash.banner', 'Imagem da Tamanho atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da Tamanho: ' . $e->getMessage());
        }
    }
}

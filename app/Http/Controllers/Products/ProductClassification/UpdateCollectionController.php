<?php

namespace App\Http\Controllers\Products\ProductClassification;

use App\Http\Controllers\Controller;
use App\Models\Products\Collection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;
use Illuminate\Support\Facades\Storage;

class UpdateCollectionController extends Controller
{
    public function edit($id)
    {
        $collection = Collection::findOrFail($id);
        return Inertia::render('Ecommerce/Admin/ProductClassification/Collections/Update', [
            'collection' => $collection,
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
            $collection = Collection::findOrFail($id);
            $collection->update($validated);

            return Redirect::route('collection.edit', $collection->id)
                ->with('flash.banner', 'Coleção atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Coleção: ' . $e->getMessage());
        }
    }

    public function updateImage(Request $request, $id)
    {
        $validated = $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        try {
            $collection = Collection::findOrFail($id);

            // Se houver uma nova imagem, processa o upload
            if ($request->hasFile('image')) {
                $image = $request->file('image');

                // Remove espaços e caracteres indesejados do nome da Coleção
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $collection->name));

                // Obtém a extensão do arquivo original
                $extension = $image->getClientOriginalExtension();

                // Cria o nome do arquivo usando o nome sanitizado da Coleção
                $filename = $sanitizedName . '_' . date('YmdHi') . '.' . $extension;

                // Salva o arquivo no sistema de arquivos configurado (usando o disco 'public' por padrão)
                $path = $image->storeAs('collections/' . $collection->id, $filename, 'public');

                // Remove a imagem antiga se existir
                if ($collection->image && $collection->image !== 'images/default.png') {
                    Storage::disk('public')->delete($collection->image);
                }

                // Atualiza o caminho da imagem na Coleção
                $collection->image = $path;
                $collection->save();
            }

            return Redirect::route('collection.edit', $collection->id)
                ->with('flash.banner', 'Imagem da Coleção atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da Coleção: ' . $e->getMessage());
        }
    }
}

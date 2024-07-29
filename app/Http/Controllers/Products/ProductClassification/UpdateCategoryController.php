<?php

namespace App\Http\Controllers\Products\ProductClassification;

use App\Http\Controllers\Controller;
use App\Models\Products\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;
use Illuminate\Support\Facades\Storage;

class UpdateCategoryController extends Controller
{
    public function edit($id)
    {
        $category = Category::findOrFail($id);
        return Inertia::render('Ecommerce/Admin/ProductClassification/Categories/Update', [
            'category' => $category,
        ]);
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'discontinued' => 'required|boolean',
            'action_user' => 'nullable|string',
        ]);

        try {
            $category = Category::findOrFail($id);
            $category->update($validated);

            return Redirect::route('category.edit', $category->id)
                ->with('flash.banner', 'Categoria atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a categoria: ' . $e->getMessage());
        }
    }

    public function updateImage(Request $request, $id)
    {
        $validated = $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        try {
            $category = Category::findOrFail($id);

            // Se houver uma nova imagem, processa o upload
            if ($request->hasFile('image')) {
                $image = $request->file('image');

                // Remove espaços e caracteres indesejados do nome da categoria
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $category->name));

                // Obtém a extensão do arquivo original
                $extension = $image->getClientOriginalExtension();

                // Cria o nome do arquivo usando o nome sanitizado da categoria
                $filename = $sanitizedName . '_' . date('YmdHi') . '.' . $extension;

                // Salva o arquivo no sistema de arquivos configurado (usando o disco 'public' por padrão)
                $path = $image->storeAs('categories/' . $category->id, $filename, 'public');

                // Remove a imagem antiga se existir
                if ($category->Image && $category->image !== 'images/default.png') {
                    Storage::disk('public')->delete($category->image);
                }

                // Atualiza o caminho da imagem na categoria
                $category->image = $path;
                $category->save();
            }

            return Redirect::route('category.edit', $category->id)
                ->with('flash.banner', 'Imagem da Categoria atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da categoria: ' . $e->getMessage());
        }
    }
}

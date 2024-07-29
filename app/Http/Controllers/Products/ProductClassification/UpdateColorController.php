<?php

namespace App\Http\Controllers\Products\ProductClassification;

use App\Http\Controllers\Controller;
use App\Models\Products\Color;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;
use Illuminate\Support\Facades\Storage;

class UpdateColorController extends Controller
{
    public function edit($id)
    {
        $color = Color::findOrFail($id);
        return Inertia::render('Ecommerce/Admin/ProductClassification/Colors/Update', [
            'color' => $color,
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
            $color = Color::findOrFail($id);
            $color->update($validated);

            return Redirect::route('color.edit', $color->id)
                ->with('flash.banner', 'Cor atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Cor: ' . $e->getMessage());
        }
    }

    public function updateImage(Request $request, $id)
    {
        $validated = $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        try {
            $color = Color::findOrFail($id);

            // Se houver uma nova imagem, processa o upload
            if ($request->hasFile('image')) {
                $image = $request->file('image');

                // Remove espaços e caracteres indesejados do nome da Cor
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $color->name));

                // Obtém a extensão do arquivo original
                $extension = $image->getClientOriginalExtension();

                // Cria o nome do arquivo usando o nome sanitizado da Cor
                $filename = $sanitizedName . '_' . date('YmdHi') . '.' . $extension;

                // Salva o arquivo no sistema de arquivos configurado (usando o disco 'public' por padrão)
                $path = $image->storeAs('colors/' . $color->id, $filename, 'public');

                // Remove a imagem antiga se existir
                if ($color->image && $color->image !== 'images/default.png') {
                    Storage::disk('public')->delete($color->image);
                }

                // Atualiza o caminho da imagem na Cor
                $color->image = $path;
                $color->save();
            }

            return Redirect::route('color.edit', $color->id)
                ->with('flash.banner', 'Imagem da Cor atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da Cor: ' . $e->getMessage());
        }
    }
}

<?php

namespace App\Http\Controllers\Products\ProductClassification;

use App\Http\Controllers\Controller;
use App\Models\Products\Subcategory;
use App\Models\Products\Group;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;
use Illuminate\Support\Facades\Storage;

class UpdateGroupController extends Controller
{
    public function edit($id)
    {

        $group = Group::findOrFail($id);
        $subcategories = Subcategory::all();

        return Inertia::render('Ecommerce/Admin/ProductClassification/Groups/Update', [
            'group' => $group,
            'subcategories' => $subcategories,
        ]);
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'subcategory_id' => 'required|exists:subcategories,id',
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'discontinued' => 'required|boolean',
            'action_user' => 'nullable|string',
        ]);

        try {
            $group = Group::findOrFail($id);
            $group->update($validated);

            return Redirect::route('group.edit', $group->id)
                ->with('flash.banner', 'Grupo atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Grupo: ' . $e->getMessage());
        }
    }

    public function updateImage(Request $request, $id)
    {
        $validated = $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        try {
            $group = Group::findOrFail($id);

            // Se houver uma nova imagem, processa o upload
            if ($request->hasFile('image')) {
                $image = $request->file('image');

                // Remove espaços e caracteres indesejados do nome do Grupos
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $group->name));

                // Obtém a extensão do arquivo original
                $extension = $image->getClientOriginalExtension();

                // Cria o nome do arquivo usando o nome sanitizado do Grupos
                $filename = $sanitizedName . '_' . date('YmdHi') . '.' . $extension;

                // Salva o arquivo no sistema de arquivos configurado (usando o disco 'public' por padrão)
                $path = $image->storeAs('groups/' . $group->id, $filename, 'public');

                // Remove a imagem antiga se existir
                if ($group->image && $group->image !== 'images/default.png') {
                    Storage::disk('public')->delete($group->image);
                }

                // Atualiza o caminho da imagem na Gruposs
                $group->image = $path;
                $group->save();
            }

            return Redirect::route('group.edit', $group->id)
                ->with('flash.banner', 'Imagem do Grupo atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem do Grupos: ' . $e->getMessage());
        }
    }
}

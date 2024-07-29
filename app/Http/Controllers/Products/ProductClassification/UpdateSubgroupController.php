<?php

namespace App\Http\Controllers\Products\ProductClassification;

use App\Http\Controllers\Controller;
use App\Models\Products\Group;
use App\Models\Products\Subgroup;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;
use Illuminate\Support\Facades\Storage;

class UpdateSubgroupController extends Controller
{
    public function edit($id)
    {

        $subgroup = Subgroup::findOrFail($id);
        $groups = Group::all();

        return Inertia::render('Ecommerce/Admin/ProductClassification/Subgroups/Update', [
            'subgroup' => $subgroup,
            'groups' => $groups,
        ]);
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'group_id' => 'required|exists:subcategories,id',
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'discontinued' => 'required|boolean',
            'deleted' => 'required|boolean',
            'action_user' => 'nullable|string',
        ]);

        try {
            $subgroup = Subgroup::findOrFail($id);
            $subgroup->update($validated);

            return Redirect::route('subgroup.edit', $subgroup->id)
                ->with('flash.banner', 'Subgrupo atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Subgrupos: ' . $e->getMessage());
        }
    }

    public function updateImage(Request $request, $id)
    {
        $validated = $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        try {
            $subgroup = Subgroup::findOrFail($id);

            // Se houver uma nova imagem, processa o upload
            if ($request->hasFile('image')) {
                $image = $request->file('image');

                // Remove espaços e caracteres indesejados do nome da Subgrupos
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $subgroup->name));

                // Obtém a extensão do arquivo original
                $extension = $image->getClientOriginalExtension();

                // Cria o nome do arquivo usando o nome sanitizado da Subgrupos
                $filename = $sanitizedName . '_' . date('YmdHi') . '.' . $extension;

                // Salva o arquivo no sistema de arquivos configurado (usando o disco 'public' por padrão)
                $path = $image->storeAs('subcategories/' . $subgroup->id, $filename, 'public');

                // Remove a imagem antiga se existir
                if ($subgroup->image && $subgroup->image !== 'images/default.png') {
                    Storage::disk('public')->delete($subgroup->image);
                }

                // Atualiza o caminho da imagem na Subgrupos
                $subgroup->image = $path;
                $subgroup->save();
            }

            return Redirect::route('subgroup.edit', $subgroup->id)
                ->with('flash.banner', 'Imagem da Subgrupo atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da Subgrupo: ' . $e->getMessage());
        }
    }
}

<?php

namespace App\Http\Controllers\Products\ProductClassification;

use App\Http\Controllers\Controller;
use Inertia\Inertia;
use App\Models\Products\Subcategory;
use App\Models\Products\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;


class CreateSubcategoryController extends Controller
{
    public function create()
    {
        $categories = Category::all();

        return Inertia::render('Ecommerce/Admin/ProductClassification/Subcategories/Create', [
            'categories' => $categories,
        ]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'category_id' => 'required|exists:categories,id',
            'name' => ['required', 'string', 'max:255', 'unique:subgroups'],
            'description' => ['nullable', 'string', 'max:255'],
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'discontinued' => ['boolean'],
            'action_user' => ['required', 'string', 'max:255'],
        ]);

        if ($validator->fails()) {
            return $request->wantsJson()
                ? response()->json(['errors' => $validator->errors()], 422)
                : redirect()->back()
                ->withErrors($validator)
                ->withInput()
                ->with('danger', 'Erro ao processar o formulário');
        }

        $validatedData = $validator->validated();



        try {
            // Cria a subgrupo sem a imagem
            $subgroup = Subcategory::create($validatedData);

            // Se houver uma imagem, processa o upload
            if ($request->file('image')) {
                $image = $request->file('image');

                // Remove espaços e caracteres indesejados do nome da subgrupo
                $sanitizedSubcategoryName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $subgroup->name));

                // Obtém a extensão do arquivo original
                $extension = $image->getClientOriginalExtension();

                // Cria o nome do arquivo usando o nome sanitizado da subgrupo
                $filename = $sanitizedSubcategoryName . '_' . date('YmdHi') . '.' . $extension;

                // Salva o arquivo no sistema de arquivos configurado (usando o disco 'public' por padrão)
                $path = $image->storeAs('subgroups/' . $subgroup->id, $filename, 'public');

                // Atualiza o caminho da imagem na subgrupo
                $subgroup->image = $path;
                $subgroup->save();
            }


            if ($request->wantsJson()) {
                return response()->json(['subgroup' => $subgroup], 201);
            }

            return redirect()->back()
                ->with('flash.banner', 'Subgrupo cadastrada com sucesso')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            if ($request->wantsJson()) {
                return response()->json(['error' => 'Erro ao criar a subgrupo: ' . $e->getMessage()], 500);
            }

            return redirect()->back()
                ->with('danger', 'Erro ao criar a subgrupo: ' . $e->getMessage());
        }
    }
}
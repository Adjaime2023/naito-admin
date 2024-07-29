<?php

namespace App\Http\Controllers\Products\ProductClassification;
use App\Http\Controllers\Controller;
use Inertia\Inertia;
use App\Models\Products\Collection;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

class CreateCollectionController extends Controller
{

    public function create()
    {
        return Inertia::render('Ecommerce/Admin/ProductClassification/Collections/Create');
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255', 'unique:collections'],
            'description' => ['nullable', 'string', 'max:255'],
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'discontinued' => ['boolean'],
            'deleted' => ['boolean'],
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
            // Cria a coleção sem a imagem
            $collection = Collection::create($validatedData);

            // Se houver uma imagem, processa o upload
            if ($request->file('image')) {
                $image = $request->file('image');

                // Remove espaços e caracteres indesejados do nome da coleção
                $sanitizedCollectionName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $collection->name));

                // Obtém a extensão do arquivo original
                $extension = $image->getClientOriginalExtension();

                // Cria o nome do arquivo usando o nome sanitizado da coleção
                $filename = $sanitizedCollectionName . '_' . date('YmdHi') . '.' . $extension;

                // Salva o arquivo no sistema de arquivos configurado (usando o disco 'public' por padrão)
                $path = $image->storeAs('collections/' . $collection->id, $filename, 'public');

                // Atualiza o caminho da imagem na coleção
                $collection->image = $path;
                $collection->save();
            }


            if ($request->wantsJson()) {
                return response()->json(['collection' => $collection], 201);
            }

            return redirect()->back()
                ->with('flash.banner', 'Coleção cadastrada com sucesso')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            if ($request->wantsJson()) {
                return response()->json(['error' => 'Erro ao criar a coleção: ' . $e->getMessage()], 500);
            }

            return redirect()->back()
                ->with('danger', 'Erro ao criar a coleção: ' . $e->getMessage());
        }
    }
}

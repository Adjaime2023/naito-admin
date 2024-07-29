<?php

namespace App\Http\Controllers\Products\ProductClassification;

use App\Http\Controllers\Controller;
use Inertia\Inertia;
use App\Models\Products\Size;
use App\Models\Products\Product;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

class CreateSizeController extends Controller
{
    public function create()
    {
        $products = Product::all();

        return Inertia::render('Ecommerce/Admin/ProductClassification/Sizes/Create', [
            'products' => $products,]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'nullable|exists:products,id',
            'name' => ['required', 'string', 'max:255', 'unique:sizes'],            
            'stock' => 'required|numeric|min:0',
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
            // Cria a Tamanho sem a imagem
            $size = Size::create($validatedData);

            // Se houver uma imagem, processa o upload
            if ($request->file('image')) {
                $image = $request->file('image');

                // Remove espaços e caracteres indesejados do nome da Tamanho
                $sanitizedSizeName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $size->name));

                // Obtém a extensão do arquivo original
                $extension = $image->getClientOriginalExtension();

                // Cria o nome do arquivo usando o nome sanitizado da Tamanho
                $filename = $sanitizedSizeName . '_' . date('YmdHi') . '.' . $extension;

                // Salva o arquivo no sistema de arquivos configurado (usando o disco 'public' por padrão)
                $path = $image->storeAs('sizes/' . $size->id, $filename, 'public');

                // Atualiza o caminho da imagem na Tamanho
                $size->image = $path;
                $size->save();
            }


            if ($request->wantsJson()) {
                return response()->json(['size' => $size], 201);
            }

            return redirect()->back()
                ->with('flash.banner', 'Tamanho cadastrado com sucesso')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            if ($request->wantsJson()) {
                return response()->json(['error' => 'Erro ao criar a Tamanho: ' . $e->getMessage()], 500);
            }

            return redirect()->back()
                ->with('danger', 'Erro ao criar a Tamanho: ' . $e->getMessage());
        }
    }
}

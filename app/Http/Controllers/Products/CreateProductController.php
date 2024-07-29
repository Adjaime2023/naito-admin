<?php

namespace App\Http\Controllers\Products;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Products\Product;
use App\Models\Products\Category;
use App\Models\Products\Subcategory;
use App\Models\Products\Group;
use App\Models\Products\Subgroup;
use App\Models\Products\Brand;
use App\Models\Products\Collection;
use App\Models\Products\Color;
use Inertia\Inertia;
use Illuminate\Support\Facades\Storage;
use NumberFormatter;

class CreateProductController extends Controller
{
    public function create()
    {
        $categories = Category::all();
        $subcategories = Subcategory::all();
        $groups = Group::all();
        $subgroups = Subgroup::all();
        $brands = Brand::all();
        $collections = Collection::all();
        $colors = Color::all();

        return Inertia::render('Ecommerce/Admin/Products/Create', [
            'categories' => $categories,
            'subcategories' => $subcategories,
            'groups' => $groups,
            'subgroups' => $subgroups,
            'brands' => $brands,
            'collections' => $collections,
            'colors' => $colors,
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'sku' => 'nullable|string',
            'qr_code' => 'nullable|string',
            'barcode' => 'nullable|string',
            'purchase_price' => 'nullable|numeric', // Aceita valores numéricos, incluindo inteiros e decimais
            'shipping_value' => 'nullable|numeric',
            'cost_price' => 'nullable|numeric',
            'profit_margin' => 'nullable|numeric',
            'freight_sale' => 'nullable|numeric',
            'sale_price' => 'nullable|numeric',
            'stock' => 'nullable|integer',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg,webp|max:2048',
            'image_hover' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg,webp|max:2048',
            'images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'launch' => 'boolean',
            'promotion' => 'boolean',
            'promotion_price' =>  'nullable|numeric',
            'category_id' => 'required|exists:categories,id',
            'subcategory_id' => 'required|exists:subcategories,id',
            'group_id' => 'nullable|exists:groups,id',
            'subgroup_id' => 'nullable|exists:subgroups,id',
            'collection_id' => 'nullable|exists:collections,id',
            'brand_id' => 'nullable|exists:brands,id',
            'color_id' => 'nullable|exists:colors,id',
            'action_user' => 'nullable|string',
            'discontinued' => 'boolean',
        ]);

        try {
      
            // Define o caminho absoluto para a imagem padrão
            $defaultImage = 'products/default.png';

            // Cria o produto sem a imagem
            $product = Product::create([
                'name' => $validated['name'],
                'sku'  => $validated['sku'],
                'qr_code'  => $validated['qr_code'],
                'barcode'  => $validated['barcode'],
                'purchase_price' => $validated['purchase_price'],
                'shipping_value' => $validated['shipping_value'],
                'cost_price' => $validated['cost_price'],
                'profit_margin' => $validated['profit_margin'],
                'freight_sale' => $validated['freight_sale'],
                'sale_price' => $validated['sale_price'],
                'stock' => $validated['stock'],
                'launch'  => $validated['launch'],
                'promotion'  => $validated['promotion'],
                'promotion_price' => $validated['promotion_price'],
                'image' => $defaultImage,
                'image_hover' => $defaultImage,
                'category_id' => $validated['category_id'],
                'subcategory_id' => $validated['subcategory_id'],
                'group_id' => $validated['group_id'],
                'subgroup_id' => $validated['subgroup_id'],
                'collection_id' => $validated['collection_id'],
                'brand_id' => $validated['brand_id'],
                'color_id' => $validated['color_id'],
                'action_user' => $validated['action_user'],
                'discontinued' => $validated['discontinued'],

            ]);

            // Upload da imagem principal, se fornecida
            if ($request->hasFile('image')) {
                $image = $request->file('image');

                // Remove espaços e caracteres indesejados do nome do produto
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $product->name));

                // Obtém a extensão do arquivo original
                $extension = $image->getClientOriginalExtension();

                // Cria o nome do arquivo usando o nome sanitizado do produto
                $filename = $sanitizedName . '_' . date('YmdHi') . '.' . $extension;

                // Salva o arquivo no sistema de arquivos configurado (usando o disco 'public' por padrão)
                $path = $image->storeAs('products/' . $product->id, $filename, 'public');

                // Atualiza o caminho da imagem no produto
                $product->image = $path;
                $product->save();
            }


            // Upload da imagem Hover, se fornecida
            if ($request->hasFile('image_hover')) {
                $image = $request->file('image_hover');

                // Remove espaços e caracteres indesejados do nome do produto
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $product->name));

                // Obtém a extensão do arquivo original
                $extension = $image->getClientOriginalExtension();

                // Cria o nome do arquivo usando o nome sanitizado do produto
                $filename = $sanitizedName . '_' . 'hover' . '_' . date('YmdHi') . '.' . $extension;

                // Salva o arquivo no sistema de arquivos configurado (usando o disco 'public' por padrão)
                $path = $image->storeAs('products/' . $product->id, $filename, 'public');

                // Atualiza o caminho da imagem no produto
                $product->image = $path;
                $product->save();
            }

            // Upload de imagens adicionais
            if ($request->hasFile('images')) {
                foreach ($request->file('images') as $image) {
                    $path = $image->store('products', 'public');
                    $product->images()->create(['path' => $path]);
                }
            }

            return redirect()->route('product.edit', $product->id)
                ->with('flash.banner', 'Produto criado com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao criar o produto: ' . $e->getMessage());
        }
    }


    public function generateDescription(Request $request)
    {
        $name = $request->input('name');
        $subgroup = Subgroup::find($request->input('subgroup_id'))->name ?? '';
        $collection = Collection::find($request->input('collection_id'))->name ?? '';
        $brand = Brand::find($request->input('brand_id'))->name ?? '';
        $color = Color::find($request->input('color_id'))->name ?? '';

        $description = "$name $subgroup $collection $brand $color";

        return response()->json(['description' => $description]);
    }
}

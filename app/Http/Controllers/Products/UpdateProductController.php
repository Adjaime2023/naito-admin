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
use App\Models\Products\ProductImage;
use Inertia\Inertia;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redirect;

class UpdateProductController extends Controller
{
    public function edit($id)
    {
        $product = Product::findOrFail($id);
        $categories = Category::all();
        $subcategories = Subcategory::all();
        $groups = Group::all();
        $subgroups = Subgroup::all();
        $brands = Brand::all();
        $collections = Collection::all();
        $colors = Color::all();

        return Inertia::render('Ecommerce/Admin/Products/Update', [
            'product' => $product,
            'categories' => $categories,
            'subcategories' => $subcategories,
            'groups' => $groups,
            'subgroups' => $subgroups,
            'brands' => $brands,
            'collections' => $collections,
            'colors' => $colors,
            'productImages' => $product->images
        ]);
    }

    public function update(Request $request, $id)
    {
        Log::info('Update product called', ['id' => $id, 'request' => $request->all()]);
    
        // Validar os dados
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'sku'  => 'nullable|string',
            'qr_code'  => 'nullable|string',
            'barcode'  => 'nullable|string',
            'purchase_price' => 'nullable|numeric',
            'shipping_value' => 'nullable|numeric',
            'cost_price' => 'nullable|numeric',
            'profit_margin' => 'nullable|numeric',
            'freight_sale' => 'nullable|numeric',
            'sale_price' => 'nullable|numeric',
            'stock' => 'nullable|integer',           
            'launch'  => 'nullable|boolean',
            'promotion'  => 'nullable|boolean',
            'promotion_price' => 'nullable|numeric|min:0',
            'category_id' => 'required|exists:categories,id',
            'subcategory_id' => 'required|exists:subcategories,id',
            'group_id' => 'nullable|exists:groups,id',
            'subgroup_id' => 'nullable|exists:subgroups,id',
            'collection_id' => 'nullable|exists:collections,id',
            'brand_id' => 'nullable|exists:brands,id',
            'color_id' => 'nullable|exists:colors,id',
            'action_user' => 'nullable|string',
            'discontinued' => 'nullable|boolean',
        ]);
    
        Log::info('Validated', ['validated' => $validated]);

        try {
            // Buscar o produto
            $product = Product::findOrFail($id);
            
            Log::info('Produto encontrado', ['product' => $product]);
    
            // Atualizar o produto
            $product->update($validated);
    
            Log::info('Produto atualizado', ['product' => $product]);
    
            // Redirecionar com mensagem de sucesso
            return Redirect::route('product.edit', $product->id)
                ->with('flash.banner', 'Produto atualizado com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar produto', ['error' => $e->getMessage()]);
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar o Produto: ' . $e->getMessage());
        }
    }
    
    

    public function updateImages(Request $request, $id)
    {
        $product = Product::findOrFail($id);
        try {
            // Validações
            $request->validate([
                'product_images.*' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            ]);

            if ($request->hasFile('product_images')) {
                $images = $request->file('product_images');
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $product->name));
                $number = 1; // Contador para nomeação única das imagens

                foreach ($images as $image) {
                    $extension = $image->getClientOriginalExtension();
                    $filename = $sanitizedName . '_' . $number . '.' . $extension;
                    $path = $image->storeAs('products/' . $product->id, $filename, 'public');

                    Log::info('Image Path: ' . $path); // Log para verificar o caminho da imagem

                    // Salva o caminho da imagem no banco de dados
                    $product->images()->create(['path' => $path]);
                    $number++;
                }
            }

            return Redirect::route('product.edit', $product->id)
                ->with('flash.banner', 'Imagens do Produto atualizadas com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar as Imagens do Produto: ' . $e->getMessage()); // Log do erro
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar as Imagens do Produto: ' . $e->getMessage());
        }
    }

    public function deleteImage($id)
    {
        $image = ProductImage::findOrFail($id);
        Storage::disk('public')->delete($image->path);
        $image->delete();

        return response()->json(['success' => true]);
    }

    public function updateImage(Request $request, $id)
    {
        $validated = $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg,webp|max:2048',
        ]);

        try {
            $product = Product::findOrFail($id);

            // Se houver uma nova imagem, processa o upload
            if ($request->hasFile('image')) {
                $image = $request->file('image');

                // Remove espaços e caracteres indesejados do nome da Produtos
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $product->name));

                // Obtém a extensão do arquivo original
                $extension = $image->getClientOriginalExtension();

                // Cria o nome do arquivo usando o nome sanitizado da Produtos
                $filename = $sanitizedName . '_' . date('YmdHi') . '.' . $extension;

                // Salva o arquivo no sistema de arquivos configurado (usando o disco 'public' por padrão)
                $path = $image->storeAs('products/' . $product->id, $filename, 'public');

                // Remove a imagem antiga se existir
                if ($product->logo_dark && $product->image !== 'images/default.png') {
                    Storage::disk('public')->delete($product->image);
                }

                // Atualiza o caminho da imagem na Produtos
                $product->image = $path;
                $product->save();
            }

            return Redirect::route('product.edit', $product->id)
                ->with('flash.banner', 'Imagem da Produtos atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da Produtos: ' . $e->getMessage());
        }
    }



    public function updateImageHover(Request $request, $id)
    {
        $validated = $request->validate([
            'image_hover' => 'required|image|mimes:jpeg,png,jpg,gif,svg,webp|max:2048',
        ]);

        try {
            $product = Product::findOrFail($id);

            // Se houver uma nova imagem, processa o upload
            if ($request->hasFile('image_hover')) {
                $image_hover = $request->file('image_hover');

                // Remove espaços e caracteres indesejados do nome do produto
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $product->name));

                // Obtém a extensão do arquivo original
                $extension = $image_hover->getClientOriginalExtension();

                // Cria o nome do arquivo usando o nome sanitizado do produto
                $filename = $sanitizedName  . '_' . 'hover' . '_' . date('YmdHi') . '.' . $extension;

                // Salva o arquivo no sistema de arquivos configurado (usando o disco 'public' por padrão)
                $path = $image_hover->storeAs('products/' . $product->id, $filename, 'public');

                // Remove a imagem antiga se existir
                if ($product->image_hover && $product->image_hover !== 'images/default.png') {
                    Storage::disk('public')->delete($product->image_hover);
                }

                // Atualiza o caminho da imagem no produto
                $product->image_hover = $path;
                $product->save();
            }

            return Redirect::route('product.edit', $product->id)
                ->with('flash.banner', 'Imagem do produto atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a imagem do produto: ' . $e->getMessage());
        }
    }


    public function generateDescription(Request $request)
    {
        $name = $request->input('name');
        $subgroup = Subgroup::find($request->input('subgroup_id'))->name ?? '';
        $collection = Collection::find($request->input('collection_id'))->name ?? '';
        $brand = Brand::find($request->input('brand_id'))->name ?? '';
        $color = Color::find($request->input('color_id'))->name ?? '';

        $description = "$name $brand $color .'Coleção '. $collection  ";

        return response()->json(['description' => $description]);
    }

}

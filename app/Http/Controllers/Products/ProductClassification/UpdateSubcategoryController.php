<?php

namespace App\Http\Controllers\Products\ProductClassification;

use App\Http\Controllers\Controller;
use App\Models\Products\Category;
use App\Models\Products\Subcategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;
use Illuminate\Support\Facades\Storage;

class UpdateSubcategoryController extends Controller
{
    public function edit($id)
    {
        $subcategory = Subcategory::findOrFail($id);
        $categories = Category::all();

        return Inertia::render('Ecommerce/Admin/ProductClassification/Subcategories/Update', [
            'subcategory' => $subcategory,
            'categories' => $categories,
        ]);
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'category_id' => 'required|exists:categories,id',
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'discontinued' => 'required|boolean',
            'action_user' => 'nullable|string',
        ]);

        try {
            $subcategory = Subcategory::findOrFail($id);
            $subcategory->update($validated);

            return Redirect::route('subcategory.edit', $subcategory->id)
                ->with('flash.banner', 'Subcategoria atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a subcategoria: ' . $e->getMessage());
        }
    }

    public function updateImage(Request $request, $id)
    {
        $validated = $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        try {
            $subcategory = Subcategory::findOrFail($id);

            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $subcategory->name));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . date('YmdHi') . '.' . $extension;
                $path = $image->storeAs('subcategories/' . $subcategory->id, $filename, 'public');

                if ($subcategory->image && $subcategory->image !== 'images/default.png') {
                    Storage::disk('public')->delete($subcategory->image);
                }

                $subcategory->image = $path;
                $subcategory->save();
            }

            return Redirect::route('subcategory.edit', $subcategory->id)
                ->with('flash.banner', 'Imagem da Subcategoria atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da subcategoria: ' . $e->getMessage());
        }
    }
}

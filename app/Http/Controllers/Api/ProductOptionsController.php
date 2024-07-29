<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Products\Product;
use App\Models\Products\Category;
use App\Models\Products\Subcategory;
use App\Models\Products\Group;
use App\Models\Products\Subgroup;
use App\Models\Products\Brand;
use App\Models\Products\Collection;
use App\Models\Products\Color;
use Illuminate\Http\Request;

class ProductOptionsController extends Controller
{
    public function index()
    {
        $subgroups = Subgroup::all(); // Exemplo de busca no banco de dados
        $collections = Collection::all();
        $brands = Brand::all();
        $colors = Color::all();
        $categories = Category::all();
        $subcategories = Subcategory::all();
        $groups = Group::all();

        return response()->json([
            'categories' => $categories,
            'subcategories' => $subcategories,
            'groups' => $groups,
            'subgroups' => $subgroups,
            'brands' => $brands,
            'collections' => $collections,
            'colors' => $colors,
        ]);
    }
}

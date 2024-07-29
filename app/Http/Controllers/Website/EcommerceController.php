<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;

use App\Models\Company; // Importe o modelo Company
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Products\Category;
use App\Models\Products\Subcategory;
use App\Models\Products\Group;
use App\Models\Products\Produto;


class EcommerceController extends Controller
{

    public function index()
    {
        $company = Company::findOrFail(1); // Substitua 1 pelo ID da sua empresa

        return Inertia::render('Ecommerce/Website/Index', [
            'company' => $company,
        ]);
    }


    public function showSubcategories($category_id)
    {
        // Verifica se o ID da categoria é válido
        $category = Category::find($category_id);

        if (!$category) {
            return response()->json(['message' => 'Category not found.'], 404);
        }

        // Carrega as subcategorias da categoria encontrada
        $subcategories = $category->subcategories;

        // Renderiza a view Inertia passando as subcategorias
        return Inertia::render('Ecommerce/Website/Subcategories', [
            'subcategories' => $subcategories
        ]);
    }

   
    public function showGroups($subcategory_id)
    {  
        // Verifica se o ID da subcategoria é válido
        $subcategory = Subcategory::find($subcategory_id);
   
        
        if (!$subcategory) {
            return response()->json(['message' => 'Subcategory not found.'], 404);
        }
    
        // Carrega as grupos da categoria encontrada
        $groups = $subcategory->groups;
       
        // Renderiza a view Inertia passando as grupos
        return Inertia::render('Ecommerce/Website/Groups', [
            'groups' => $groups
        ]);
    }

    public function showGroupProducts($group_id)
    {
        $group = Group::find($group_id);
    
        if (!$group) {
            return response()->json(['message' => 'Group not found.'], 404);
        }
    
        $products = $group->products;
    
        return Inertia::render('Ecommerce/Website/Products', [
            'products' => $products
        ]);
    }
    
    
    public function products()
    {
        return Inertia::render('Ecommerce/Website/Products');
    }


    public function balancas()
    {
        return Inertia::render('Ecommerce/Website/Balancas');
    }

    public function acessoriosInsumos()
    {
        return Inertia::render('Ecommerce/Website/AcessoriosInsumos');
    }

    public function servicos()
    {
        return Inertia::render('Ecommerce/Website/Servicos');
    }

    public function impressoras()
    {
        return Inertia::render('Ecommerce/Website/Impressoras');
    }

    public function showMap()
    {
        return Inertia::render('MapPage');
    }


    public function contact()
    {
        return Inertia::render('Ecommerce/Website/Contact');
    }

    public function websiteSubcategory()
    {



        return Inertia::render('Ecommerce/Website/WebsiteSubcategory');
    }

    public function websiteGroup()

    {

        return Inertia::render('Ecommerce/Website/WebsiteGroup');
    }

    public function navbar()
    {
        $company = Company::findOrFail(1); // Substitua 1 pelo ID da sua empresa

        return Inertia::render('Ecommerce/Website/Global/Navbar', [
            'company' => $company,
        ]);
    }
}

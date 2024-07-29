<?php

namespace App\Http\Controllers\Site\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Products\Category;
use App\Models\Products\Subcategory;
use Illuminate\Support\Facades\Log;

class SiteSubcategoriesApiController extends Controller
{
    public function apiSubcategories($categoryId)
    {
        Log::info('Método Subcategoria chamado.');
        try {
            $subcategories = Subcategory::where('category_id', $categoryId)->get();

            Log::info('Consulta de Subcategoria executada com sucesso.');

            return response()->json(['category' => Category::find($categoryId), 'subcategories' => $subcategories]);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());
            return response()->json(['error' => 'Internal Server Error'], 500);
        }
    }
}

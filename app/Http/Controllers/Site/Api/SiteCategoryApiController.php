<?php

namespace App\Http\Controllers\Site\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Products\Category;
use Illuminate\Support\Facades\Log;

class SiteCategoryApiController extends Controller
{
    public function siteCategory(Request $request)
    {
        Log::info('Método Categoria chamado.');
        try {
            $query = Category::query();
            $query->where('discontinued', false);

            // Include deleted categories
            if ($request->has('deleted')) {
                $query->withTrashed()->whereNotNull('deleted_at');
            } else {
                $query->whereNull('deleted_at');
            }

            $query->orderBy('id', 'desc');
            $categories = $query->get();

            Log::info('Consulta de Categoria executada com sucesso.');

            return response()->json($categories);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());
            return response()->json(['error' => 'Internal Server Error'], 500);
        }
    }
}

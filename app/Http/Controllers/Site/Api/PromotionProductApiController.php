<?php

namespace App\Http\Controllers\Site\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Products\Product;
use Illuminate\Support\Facades\Log;

class PromotionProductApiController extends Controller
{
    public function promotion(Request $request)
    {
        Log::info('Método promotion chamado.');
        try {
            $itemsPerPage = $request->input('itemsPerPage', 10);

            // Constrói a consulta base utilizando Eloquent ORM

            $query = Product::query();
            $query->where('promotion', true)
                ->where('discontinued', false);


            // Include deleted partners
            if ($request->has('deleted')) {
                $query->withTrashed()->whereNotNull('deleted_at');
            } else {
                $query->whereNull('deleted_at');
            }

            $query->orderBy('id', 'desc');
            $products = $query->paginate($itemsPerPage);


            // Executa a consulta paginada
            $products = $query->paginate($itemsPerPage);

            Log::info('Consulta de Produto executada com sucesso.');


            return response()->json($products);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());
            return response()->json(['error' => 'Internal Server Error'], 500);
        }
    }
}

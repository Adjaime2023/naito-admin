<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Products\Product;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Log;

class ProductApiController extends Controller
{
    public function index(Request $request)
    {
        try {
            // Parâmetros de ordenação e paginação
            $sortField = $request->input('sortField', 'name');
            $sortDirection = $request->input('sortDirection', 'asc');
            $itemsPerPage = $request->input('itemsPerPage', 10);

            // Constrói a consulta base utilizando Eloquent ORM
            $query = Product::with(['category', 'subcategory', 'group', 'subgroup', 'brand', 'collection', 'color']);

            // Aplicar filtros dinâmicos
            $this->applyFilters($query, $request);

            // Aplica filtro de termo de pesquisa
            $this->applySearch($query, $request);

            // Ordena os resultados
            if (in_array($sortField, ['category_name', 'subcategory_name', 'group_name', 'subgroup_name', 'brand_name', 'collection_name', 'color_name'])) {
                $relation = str_replace('_name', '', $sortField);
                $query->orderBy($relation . '.name', $sortDirection);
            } else {
                $query->orderBy('products.' . $sortField, $sortDirection);
            }

            // Executa a consulta paginada
            $products = $query->paginate($itemsPerPage);

            Log::info('Consulta de Produto executada com sucesso.');

            return response()->json($products);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());
            return response()->json(['error' => 'Internal Server Error'], 500);
        }
    }

    public function show($productId)
    {
        try {
            $product = Product::with(['category', 'subcategory', 'group', 'subgroup', 'brand', 'collection', 'color'])->findOrFail($productId);
            Log::info('Consulta de Produto específico executada com sucesso.');
            return response()->json($product);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());
            return response()->json(['error' => 'Produto não encontrado'], 404);
        }
    }

    public function updateDiscontinued(Request $request, $productId)
    {
        return $this->updateProductField($request, $productId, 'discontinued');
    }

    public function updatePromotion(Request $request, $productId)
    {
        return $this->updateProductField($request, $productId, 'promotion');
    }

    public function updateLaunch(Request $request, $productId)
    {
        return $this->updateProductField($request, $productId, 'launch');
    }

    public function updateDeleted(Request $request, $productId)
    {
        try {
            $product = Product::withTrashed()->findOrFail($productId);

            if ($request->has('deleted')) {
                $updatedDeleted = (bool) $request->input('deleted');

                if ($updatedDeleted) {
                    $product->delete();
                } else {
                    $product->restore();
                }

                Log::info("Produto ID {$productId} atualizado para deleted: {$updatedDeleted}");
                return response()->json(['deleted' => $updatedDeleted]);
            } else {
                return response()->json(['error' => 'Campo \'deleted\' não fornecido na requisição'], 400);
            }
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo deleted: ' . $e->getMessage());
            return response()->json(['error' => 'Erro ao atualizar o Produto'], 500);
        }
    }

    private function applyFilters(&$query, $request)
    {
        $filters = ['discontinued', 'launch', 'promotion'];
        foreach ($filters as $filter) {
            if ($request->has($filter)) {
                $value = $request->input($filter) === 'true';
                $query->where($filter, $value);
            }
        }

        if ($request->has('deleted')) {
            $query->withTrashed()->whereNotNull('deleted_at');
        } else {
            $query->whereNull('deleted_at');
        }
    }

    private function applySearch(&$query, $request)
    {
        if ($request->has('searchTerm')) {
            $searchTerm = '%' . $request->input('searchTerm') . '%';
            $searchField = $request->input('searchField');

            $query->where(function ($subquery) use ($searchTerm, $searchField) {
                $subquery->where('products.name', 'like', $searchTerm)
                    ->orWhere('products.description', 'like', $searchTerm);

                if ($searchField === null) {
                    $subquery->orWhereHas('category', function ($q) use ($searchTerm) {
                        $q->where('name', 'like', $searchTerm);
                    })->orWhereHas('subcategory', function ($q) use ($searchTerm) {
                        $q->where('name', 'like', $searchTerm);
                    })->orWhereHas('group', function ($q) use ($searchTerm) {
                        $q->where('name', 'like', $searchTerm);
                    })->orWhereHas('subgroup', function ($q) use ($searchTerm) {
                        $q->where('name', 'like', $searchTerm);
                    })->orWhereHas('brand', function ($q) use ($searchTerm) {
                        $q->where('name', 'like', $searchTerm);
                    })->orWhereHas('collection', function ($q) use ($searchTerm) {
                        $q->where('name', 'like', $searchTerm);
                    })->orWhereHas('color', function ($q) use ($searchTerm) {
                        $q->where('name', 'like', $searchTerm);
                    });
                } else {
                    if (in_array($searchField, ['category_name', 'subcategory_name', 'group_name', 'subgroup_name', 'brand_name', 'collection_name', 'color_name'])) {
                        $relation = str_replace('_name', '', $searchField);
                        $subquery->orWhereHas($relation, function ($q) use ($searchTerm) {
                            $q->where('name', 'like', $searchTerm);
                        });
                    } else {
                        $subquery->orWhere('products.' . $searchField, 'like', $searchTerm);
                    }
                }
            });
        }
    }

    private function updateProductField(Request $request, $productId, $field)
    {
        try {
            $product = Product::findOrFail($productId);
            $product->$field = $request->input($field);
            $product->save();

            Log::info("Produto ID {$productId} atualizado para {$field}: {$product->$field}");
            return response()->json([$field => $product->$field]);
        } catch (\Exception $e) {
            Log::error("Erro ao atualizar o campo {$field}: " . $e->getMessage());
            return response()->json(['error' => 'Erro ao atualizar o produto'], 500);
        }
    }
}

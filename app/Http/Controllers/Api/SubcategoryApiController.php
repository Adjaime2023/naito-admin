<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Products\Subcategory;
use Illuminate\Support\Facades\Log;

class SubcategoryApiController extends Controller
{
    public function index(Request $request)
    {
        try {
            $sortField = $request->input('sortField', 'name');
            $sortDirection = $request->input('sortDirection', 'asc');
            $itemsPerPage = $request->input('itemsPerPage', 10);

            $query = Subcategory::with(['category']);

           
            // Filtro de Categoria descontinuados
            if ($request->has('discontinued')) {
                $discontinued = $request->input('discontinued') === 'true';
                $query->where('discontinued', $discontinued);
            }

            // Include deleted categories
            if ($request->has('deleted')) {
                $query->withTrashed()->whereNotNull('deleted_at');
            } else {
                $query->whereNull('deleted_at');
            } 
            
            if ($request->has('searchTerm')) {
                $searchTerm = '%' . $request->input('searchTerm') . '%';

                if ($request->input('searchField') === null) {
                    $query->where(function ($subquery) use ($searchTerm) {
                        foreach ([
                            'category_id',
                            'name',
                            'description',
                            'action_user',
                            'discontinued',
                        ] as $field) {
                            $subquery->orWhere($field, 'like', $searchTerm);
                        }
                        // Adicionando filtro para category.name
                        $subquery->orWhereHas('category', function ($subcategoryQuery) use ($searchTerm) {
                            $subcategoryQuery->where('name', 'like', $searchTerm);
                        });
                    });
                } else {
                    if ($request->input('searchField') === 'category_name') {
                        $query->whereHas('category', function ($subcategoryQuery) use ($searchTerm) {
                            $subcategoryQuery->where('name', 'like', $searchTerm);
                        });
                    } else {
                        $query->where($request->input('searchField'), 'like', $searchTerm);
                    }
                }
            }

            $subcategories = $query->orderBy($sortField, $sortDirection)->paginate($itemsPerPage);

            Log::info('Consulta de Subcategoria executada com sucesso.');

            return response()->json($subcategories);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());

            return response()->json(['error' => 'Internal Server Error'], 500);
        }
    }

    public function show($subcategoryId)
    {
        try {
            $subcategory = Subcategory::with(['category'])->findOrFail($subcategoryId);

            Log::info('Consulta de Subcategoria específico executada com sucesso.');

            return response()->json($subcategory);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());

            return response()->json(['error' => 'Subcategoria não encontrado'], 404);
        }
    }

    public function updateDiscontinued(Request $request, $subcategoryId)
    {
        try {
            $subcategory = Subcategory::findOrFail($subcategoryId);
            $subcategory->discontinued = $request->input('discontinued');
            $subcategory->save();

            Log::info("Subcategoria ID {$subcategoryId} atualizado para discontinued: {$subcategory->discontinued}");

            return response()->json(['discontinued' => $subcategory->discontinued]);
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo discontinued: ' . $e->getMessage());

            return response()->json(['error' => 'Erro ao atualizar o produto'], 500);
        }
    }

    
    public function updateDeleted(Request $request, $subcategoryId)
    {
        try {
            // Busca o Subcategoria, incluindo os deletados (soft deletes)
            $subcategory = Subcategory::withTrashed()->findOrFail($subcategoryId);

            // Verifica se o campo 'deleted' está presente na requisição
            if ($request->has('deleted')) {
                $updatedDeleted = (bool) $request->input('deleted');

                // Se 'deleted' for true, deleta o Subcategoria (soft delete)
                if ($updatedDeleted) {
                    $subcategory->delete();
                } else {
                    // Se 'deleted' for false, restaura o Subcategoria
                    $subcategory->restore();
                }

                // Log da operação realizada
                Log::info("Categoria ID {$subcategoryId} atualizado para deleted: {$updatedDeleted}");

                // Retorna uma resposta JSON com o estado atualizado
                return response()->json(['deleted' => $updatedDeleted]);
            } else {
                // Caso o campo 'deleted' não esteja presente na requisição
                return response()->json(['error' => 'Campo \'deleted\' não fornecido na requisição'], 400);
            }
        } catch (\Exception $e) {
            // Captura e registra qualquer exceção ocorrida durante o processo
            Log::error('Erro ao atualizar o campo deleted: ' . $e->getMessage());

            // Retorna uma resposta de erro padrão em caso de falha
            return response()->json(['error' => 'Erro ao atualizar o Categoria'], 500);
        }
    }
}

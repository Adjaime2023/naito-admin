<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Products\Category;
use Illuminate\Support\Facades\Log;

class CategoryApiController extends Controller
{
    public function index(Request $request)
    {
        try {
            $sortField = $request->input('sortField', 'name');
            $sortDirection = $request->input('sortDirection', 'asc');
            $itemsPerPage = $request->input('itemsPerPage', 10);

            $query = Category::query();

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
                        foreach (['name', 'description'] as $field) {
                            $subquery->orWhere($field, 'like', $searchTerm);
                        }
                    });
                } else {
                    $query->where($request->input('searchField'), 'like', $searchTerm);
                }
            }

            $categories = $query->orderBy($sortField, $sortDirection)->paginate($itemsPerPage);

            Log::info('Consulta de Categoria executada com sucesso.');

            return response()->json($categories);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());

            return response()->json(['error' => 'Internal Server Error'], 500);
        }
    }

    public function show($categoryId)
    {
        try {
            $category = Category::query()->findOrFail($categoryId);

            Log::info('Consulta de Categoria específico executada com sucesso.');

            return response()->json($category);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());

            return response()->json(['error' => 'Categoria não encontrado'], 404);
        }
    }

    public function updateDiscontinued(Request $request, $categoryId)
    {
        try {
            $category = Category::findOrFail($categoryId);
            $category->discontinued = $request->input('discontinued');
            $category->save();

            Log::info("Categoria ID {$categoryId} atualizado para discontinued: {$category->discontinued}");

            return response()->json(['discontinued' => $category->discontinued]);
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo discontinued: ' . $e->getMessage());

            return response()->json(['error' => 'Erro ao atualizar o Categoria'], 500);
        }
    }

    public function updateDeleted(Request $request, $categoryId)
    {
        try {
            // Busca o Categoria, incluindo os deletados (soft deletes)
            $category = Category::withTrashed()->findOrFail($categoryId);

            // Verifica se o campo 'deleted' está presente na requisição
            if ($request->has('deleted')) {
                $updatedDeleted = (bool) $request->input('deleted');

                // Se 'deleted' for true, deleta o Categoria (soft delete)
                if ($updatedDeleted) {
                    $category->delete();
                } else {
                    // Se 'deleted' for false, restaura o Categoria
                    $category->restore();
                }

                // Log da operação realizada
                Log::info("Categoria ID {$categoryId} atualizado para deleted: {$updatedDeleted}");

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

<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Products\Size;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Log;


class SizeApiController extends Controller
{
    
    public function index(Request $request)
    {
        try {
            $sortField = $request->input('sortField', 'name');
            $sortDirection = $request->input('sortDirection', 'asc');
            $itemsPerPage = $request->input('itemsPerPage', 10);

            $query = Size::with(['product', 'product.color']);

            // Filtro de Tamanhos descontinuados
            if ($request->has('discontinued')) {
                $discontinued = $request->input('discontinued') === 'true';
                $query->where('discontinued', $discontinued);
            }

            if ($request->has('searchTerm')) {
                $searchTerm = '%' . $request->input('searchTerm') . '%';

                // Verifica se o campo de busca está especificado
                if ($request->input('searchField') === null) {
                    // Se não especificado, aplica filtro nos campos principais, no nome do produto e no nome da cor
                    $query->where(function ($subquery) use ($searchTerm) {
                        foreach ([
                            'product_id',
                            'name',
                            'description',
                            'action_user',
                            'discontinued',
                            'deleted',
                        ] as $field) {
                            $subquery->orWhere($field, 'like', $searchTerm);
                        }
                        // Adiciona filtro para o nome do produto
                        $subquery->orWhereHas('product', function ($productQuery) use ($searchTerm) {
                            $productQuery->where('name', 'like', $searchTerm);
                        })->orWhereHas('product.color', function ($colorQuery) use ($searchTerm) {
                            $colorQuery->where('name', 'like', $searchTerm);
                        });
                    });
                } else {
                    // Se especificado, verifica o tipo de campo de busca
                    if ($request->input('searchField') === 'product_name') {
                        // Filtra pelo nome do produto
                        $query->whereHas('product', function ($productQuery) use ($searchTerm) {
                            $productQuery->where('name', 'like', $searchTerm);
                        });
                    } elseif ($request->input('searchField') === 'color_name') {
                        // Filtra pelo nome da cor
                        $query->whereHas('product.color', function ($colorQuery) use ($searchTerm) {
                            $colorQuery->where('name', 'like', $searchTerm);
                        });
                    } else {
                        // Filtra pelo campo especificado em searchField
                        $query->where($request->input('searchField'), 'like', $searchTerm);
                    }
                }
            }

            $sizes = $query->orderBy($sortField, $sortDirection)->paginate($itemsPerPage);

            Log::info('Consulta de Tamanho executada com sucesso.');

            return response()->json($sizes);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());

            return response()->json(['error' => 'Internal Server Error'], 500);
        }
    }

    
    public function show($sizeId)
    {
        try {
            $size = Size::query()->findOrFail($sizeId);

            Log::info('Consulta de Tamanho específico executada com sucesso.');

            return response()->json($size);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());

            return response()->json(['error' => 'Tamanho não encontrado'], 404);
        }
    }
    public function updateDiscontinued(Request $request, $sizeId)
    {
        try {
            $size = Size::findOrFail($sizeId);
            $size->discontinued = $request->input('discontinued');
            $size->save();

            Log::info("Tamanho ID {$sizeId} atualizado para discontinued: {$size->discontinued}");

            return response()->json(['discontinued' => $size->discontinued]);
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo discontinued: ' . $e->getMessage());

            return response()->json(['error' => 'Erro ao atualizar o Tamanho'], 500);
        }
    }

   
    
    public function updateDeleted(Request $request, $sizeId)
    {
        try {
            // Busca o Tamanho, incluindo os deletados (soft deletes)
            $size = Size::withTrashed()->findOrFail($sizeId);

            // Verifica se o campo 'deleted' está presente na requisição
            if ($request->has('deleted')) {
                $updatedDeleted = (bool) $request->input('deleted');

                // Se 'deleted' for true, deleta o Tamanho (soft delete)
                if ($updatedDeleted) {
                    $size->delete();
                } else {
                    // Se 'deleted' for false, restaura o Tamanho
                    $size->restore();
                }

                // Log da operação realizada
                Log::info("Tamanho ID {$sizeId} atualizado para deleted: {$updatedDeleted}");

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
            return response()->json(['error' => 'Erro ao atualizar o Tamanho'], 500);
        }
    }
}

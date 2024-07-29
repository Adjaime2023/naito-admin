<?php

namespace App\Http\Controllers\Movements\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Movements\NfeEntrada;
use Illuminate\Support\Facades\Log;

class NfeEntradaApiController extends Controller
{
    /**
     * Display a listing of NfeEntrada.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try {
            $sortField = $request->input('sortField', 'numero');
            $sortDirection = $request->input('sortDirection', 'asc');
            $itemsPerPage = $request->input('itemsPerPage', 10);

            $query = NfeEntrada::query();

            // Filtro de Nfe Entrada descontinuados
            if ($request->has('discontinued')) {
                $discontinued = $request->input('discontinued') === 'true';
                $query->where('discontinued', $discontinued);
            }

             // Include deleted partners
            if ($request->has('deleted')) {
                $query->withTrashed()->whereNotNull('deleted_at');
            } else {
                $query->whereNull('deleted_at');
            }

            if ($request->has('searchTerm')) {
                $searchTerm = '%' . $request->input('searchTerm') . '%';
                $searchField = $request->input('searchField', 'nome_emitente');
                $query->where($searchField, 'like', $searchTerm);
            }

            $nfeEntradas = $query->orderBy($sortField, $sortDirection)->paginate($itemsPerPage);

            Log::info('Consulta de Nfe Entrada executada com sucesso.');

            return response()->json($nfeEntradas);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());

            return response()->json(['error' => 'Internal Server Error'], 500);
        }
    }

    /**
     * Display the specified NfeEntrada.
     *
     * @param  int  $nfeEntradaId
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($nfeEntradaId)
    {
        try {
            $nfeEntrada = NfeEntrada::findOrFail($nfeEntradaId);
            Log::info('Consulta de Nfe Entrada específica executada com sucesso.');
            return response()->json($nfeEntrada);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());
            return response()->json(['error' => 'Nfe Entrada não encontrada'], 404);
        }
    }

    /**
     * Update the specified NfeEntrada's discontinued status.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $nfeEntradaId
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateDiscontinued(Request $request, $nfeEntradaId)
    {
        try {
            $nfeEntrada = NfeEntrada::findOrFail($nfeEntradaId);
            $nfeEntrada->discontinued = $request->input('discontinued');
            $nfeEntrada->save();

            Log::info("Nfe Entrada ID {$nfeEntradaId} atualizado para discontinued: {$nfeEntrada->discontinued}");

            return response()->json(['discontinued' => $nfeEntrada->discontinued]);
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo discontinued: ' . $e->getMessage());

            return response()->json(['error' => 'Erro ao atualizar o Nfe Entrada'], 500);
        }
    }

    /**
     * Update the specified NfeEntrada's deleted status.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $nfeEntradaId
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateDeleted(Request $request, $nfeEntradaId)
    {
        try {
            // Busca o Nfe Entrada, incluindo os deletados (soft deletes)
            $nfeEntrada = NfeEntrada::withTrashed()->findOrFail($nfeEntradaId);

            // Verifica se o campo 'deleted' está presente na requisição
            if ($request->has('deleted')) {
                $updatedDeleted = (bool) $request->input('deleted');

                // Se 'deleted' for true, deleta o Nfe Entrada (soft delete)
                if ($updatedDeleted) {
                    $nfeEntrada->delete();
                } else {
                    // Se 'deleted' for false, restaura o Nfe Entrada
                    $nfeEntrada->restore();
                }

                // Log da operação realizada
                Log::info("Nfe Entrada ID {$nfeEntradaId} atualizado para deleted: {$updatedDeleted}");

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
            return response()->json(['error' => 'Erro ao atualizar o Nfe Entrada'], 500);
        }
    }
}

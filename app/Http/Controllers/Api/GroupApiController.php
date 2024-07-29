<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Products\Group;
use Illuminate\Support\Facades\Log;


class GroupApiController extends Controller
{
    public function index(Request $request)
    {
        try {
            $sortField = $request->input('sortField', 'name');
            $sortDirection = $request->input('sortDirection', 'asc');
            $itemsPerPage = $request->input('itemsPerPage', 10);

            $query = Group::query();

           // Filtro de Grupo descontinuados
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
                            'group_id',
                            'name',
                            'description',
                            'action_user',
                            'discontinued',
                        ] as $field) {
                            $subquery->orWhere($field, 'like', $searchTerm);
                        }
                    });
                } else {
                    $query->where($request->input('searchField'), 'like', $searchTerm);
                }
            }

            $groups = $query->orderBy($sortField, $sortDirection)->paginate($itemsPerPage);

            Log::info('Consulta de Grupo executada com sucesso.');

            return response()->json($groups);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());

            return response()->json(['error' => 'Internal Server Error'], 500);
        }
    }

    public function show($groupId)
    {
        try {
            $group = Group::query()->findOrFail($groupId);

            Log::info('Consulta de Grupo específico executada com sucesso.');

            return response()->json($group);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());

            return response()->json(['error' => 'Grupo não encontrado'], 404);
        }
    }

    public function updateDiscontinued(Request $request, $groupId)
    {
        try {
            $group = Group::findOrFail($groupId);
            $group->discontinued = $request->input('discontinued');
            $group->save();

            Log::info("Grupo ID {$groupId} atualizado para discontinued: {$group->discontinued}");

            return response()->json(['discontinued' => $group->discontinued]);
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo discontinued: ' . $e->getMessage());

            return response()->json(['error' => 'Erro ao atualizar o Grupo'], 500);
        }
    }

    public function updateDeleted(Request $request, $groupId)
    {
        try {
            // Busca o Grupo, incluindo os deletados (soft deletes)
            $group = Group::withTrashed()->findOrFail($groupId);

            // Verifica se o campo 'deleted' está presente na requisição
            if ($request->has('deleted')) {
                $updatedDeleted = (bool) $request->input('deleted');

                // Se 'deleted' for true, deleta o Grupo (soft delete)
                if ($updatedDeleted) {
                    $group->delete();
                } else {
                    // Se 'deleted' for false, restaura o Grupo
                    $group->restore();
                }

                // Log da operação realizada
                Log::info("Grupo ID {$groupId} atualizado para deleted: {$updatedDeleted}");

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
            return response()->json(['error' => 'Erro ao atualizar o Grupo'], 500);
        }
    }
}

<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Products\Subgroup;
use Illuminate\Support\Facades\Log;


class SubgroupApiController extends Controller
{
    public function index(Request $request)
    {
        try {
            $sortField = $request->input('sortField', 'name');
            $sortDirection = $request->input('sortDirection', 'asc');
            $itemsPerPage = $request->input('itemsPerPage', 10);

            $query = Subgroup::query();

            // Filtros de descontinuação e exclusão
            if ($request->has('discontinued')) {
                $query->where('discontinued', $request->input('discontinued'));
            }

            if ($request->has('deleted')) {
                $query->where('deleted', $request->input('deleted'));
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
                            'deleted',
                        ] as $field) {
                            $subquery->orWhere($field, 'like', $searchTerm);
                        }
                    });
                } else {
                    $query->where($request->input('searchField'), 'like', $searchTerm);
                }
            }

            $subgroups = $query->orderBy($sortField, $sortDirection)->paginate($itemsPerPage);

            Log::info('Consulta de Subgrupo executada com sucesso.');

            return response()->json($subgroups);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());

            return response()->json(['error' => 'Internal Server Error'], 500);
        }
    }

    public function show($subgroupId)
    {
        try {
            $subgroup = Subgroup::query()->findOrFail($subgroupId);

            Log::info('Consulta de Subgrupo específico executada com sucesso.');

            return response()->json($subgroup);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());

            return response()->json(['error' => 'Subgrupo não encontrado'], 404);
        }
    }

    public function updateDiscontinued(Request $request, $subgroupId)
    {
        try {
            $subgroup = Subgroup::findOrFail($subgroupId);
            $subgroup->discontinued = $request->input('discontinued');
            $subgroup->save();

            Log::info("Subgrupo ID {$subgroupId} atualizado para discontinued: {$subgroup->discontinued}");

            return response()->json(['discontinued' => $subgroup->discontinued]);
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo discontinued: ' . $e->getMessage());

            return response()->json(['error' => 'Erro ao atualizar o Subgrupo'], 500);
        }
    }

    public function updateDeleted(Request $request, $subgroupId)
    {
        try {
            $subgroup = Subgroup::findOrFail($subgroupId);
            $subgroup->deleted = $request->input('deleted');
            $subgroup->save();

            Log::info("Subgrupo ID {$subgroupId} atualizado para deleted: {$subgroup->deleted}");

            return response()->json(['deleted' => $subgroup->deleted]);
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo deleted: ' . $e->getMessage());

            return response()->json(['error' => 'Erro ao atualizar o Subgrupo'], 500);
        }
    }
}

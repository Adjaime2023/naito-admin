<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Products\Collection;
use Illuminate\Support\Facades\Log;


class CollectionApiController extends Controller
{
    public function index(Request $request)
    {
        try {
            $sortField = $request->input('sortField', 'name');
            $sortDirection = $request->input('sortDirection', 'asc');
            $itemsPerPage = $request->input('itemsPerPage', 10);

            $query = Collection::query();

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

            $collections = $query->orderBy($sortField, $sortDirection)->paginate($itemsPerPage);

            Log::info('Consulta de Coleção executada com sucesso.');

            return response()->json($collections);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());

            return response()->json(['error' => 'Internal Server Error'], 500);
        }
    }

    public function show($collectionId)
    {
        try {
            $collection = Collection::query()->findOrFail($collectionId);

            Log::info('Consulta de Coleção específico executada com sucesso.');

            return response()->json($collection);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());

            return response()->json(['error' => 'Coleção não encontrado'], 404);
        }
    }

    public function updateDiscontinued(Request $request, $collectionId)
    {
        try {
            $collection = Collection::findOrFail($collectionId);
            $collection->discontinued = $request->input('discontinued');
            $collection->save();

            Log::info("Coleção ID {$collectionId} atualizado para discontinued: {$collection->discontinued}");

            return response()->json(['discontinued' => $collection->discontinued]);
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo discontinued: ' . $e->getMessage());

            return response()->json(['error' => 'Erro ao atualizar o Coleção'], 500);
        }
    }

    public function updateDeleted(Request $request, $collectionId)
    {
        try {
            $collection = Collection::findOrFail($collectionId);
            $collection->deleted = $request->input('deleted');
            $collection->save();

            Log::info("Coleção ID {$collectionId} atualizado para deleted: {$collection->deleted}");

            return response()->json(['deleted' => $collection->deleted]);
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo deleted: ' . $e->getMessage());

            return response()->json(['error' => 'Erro ao atualizar o Coleção'], 500);
        }
    }
}

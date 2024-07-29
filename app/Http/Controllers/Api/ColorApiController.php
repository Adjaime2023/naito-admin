<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Products\Color;
use Illuminate\Support\Facades\Log;


class ColorApiController extends Controller
{
    public function index(Request $request)
    {
        try {
            $sortField = $request->input('sortField', 'name');
            $sortDirection = $request->input('sortDirection', 'asc');
            $itemsPerPage = $request->input('itemsPerPage', 10);

            $query = Color::query();

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

            $colors = $query->orderBy($sortField, $sortDirection)->paginate($itemsPerPage);

            Log::info('Consulta de Cor executada com sucesso.');

            return response()->json($colors);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());

            return response()->json(['error' => 'Internal Server Error'], 500);
        }
    }

    public function show($colorId)
    {
        try {
            $color = Color::query()->findOrFail($colorId);

            Log::info('Consulta de Cor específico executada com sucesso.');

            return response()->json($color);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());

            return response()->json(['error' => 'Cor não encontrado'], 404);
        }
    }

    public function updateDiscontinued(Request $request, $colorId)
    {
        try {
            $color = Color::findOrFail($colorId);
            $color->discontinued = $request->input('discontinued');
            $color->save();

            Log::info("Cor ID {$colorId} atualizado para discontinued: {$color->discontinued}");

            return response()->json(['discontinued' => $color->discontinued]);
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo discontinued: ' . $e->getMessage());

            return response()->json(['error' => 'Erro ao atualizar o Cor'], 500);
        }
    }

    public function updateDeleted(Request $request, $colorId)
    {
        try {
            $color = Color::findOrFail($colorId);
            $color->deleted = $request->input('deleted');
            $color->save();

            Log::info("Cor ID {$colorId} atualizado para deleted: {$color->deleted}");

            return response()->json(['deleted' => $color->deleted]);
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo deleted: ' . $e->getMessage());

            return response()->json(['error' => 'Erro ao atualizar o Cor'], 500);
        }
    }
}

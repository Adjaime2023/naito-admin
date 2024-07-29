<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Products\Brand;
use Illuminate\Support\Facades\Log;


class BrandApiController extends Controller
{
    public function index(Request $request)
    {
        try {
            $sortField = $request->input('sortField', 'name');
            $sortDirection = $request->input('sortDirection', 'asc');
            $itemsPerPage = $request->input('itemsPerPage', 10);

            $query = Brand::query();

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

            $brands = $query->orderBy($sortField, $sortDirection)->paginate($itemsPerPage);

            Log::info('Consulta de Marca executada com sucesso.');

            return response()->json($brands);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());

            return response()->json(['error' => 'Internal Server Error'], 500);
        }
    }

    public function show($brandId)
    {
        try {
            $brand = Brand::query()->findOrFail($brandId);

            Log::info('Consulta de Marca específico executada com sucesso.');

            return response()->json($brand);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());

            return response()->json(['error' => 'Marca não encontrado'], 404);
        }
    }

    public function updateDiscontinued(Request $request, $brandId)
    {
        try {
            $brand = Brand::findOrFail($brandId);
            $brand->discontinued = $request->input('discontinued');
            $brand->save();

            Log::info("Marca ID {$brandId} atualizado para discontinued: {$brand->discontinued}");

            return response()->json(['discontinued' => $brand->discontinued]);
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo discontinued: ' . $e->getMessage());

            return response()->json(['error' => 'Erro ao atualizar o Marca'], 500);
        }
    }

    public function updateDeleted(Request $request, $brandId)
    {
        try {
            $brand = Brand::findOrFail($brandId);
            $brand->deleted = $request->input('deleted');
            $brand->save();

            Log::info("Marca ID {$brandId} atualizado para deleted: {$brand->deleted}");

            return response()->json(['deleted' => $brand->deleted]);
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo deleted: ' . $e->getMessage());

            return response()->json(['error' => 'Erro ao atualizar o Marca'], 500);
        }
    }
}

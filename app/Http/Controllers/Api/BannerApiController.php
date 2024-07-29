<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Banner;
use Illuminate\Support\Facades\Log;

class BannerApiController extends Controller
{
    public function index(Request $request)
{
    try {
        $sortField = $request->input('sortField', 'title');
        $sortDirection = $request->input('sortDirection', 'asc');
        $itemsPerPage = $request->input('itemsPerPage', 10);

        $query = Banner::query();

        // Filtro de Parceiros descontinuados
        if ($request->has('discontinued')) {
            $discontinued = $request->input('discontinued') === 'true';
            $query->where('discontinued', $discontinued);
        }

        // Include deleted banners
        if ($request->has('deleted')) {
            $query->withTrashed()->whereNotNull('deleted_at');
        } else {
            $query->whereNull('deleted_at');
        }

        // Filtro de pesquisa
        if ($request->has('searchTerm')) {
            $searchTerm = '%' . $request->input('searchTerm') . '%';
            if ($request->input('searchField') === null) {
                $query->where(function ($subquery) use ($searchTerm) {
                    $subquery->orWhere('title', 'like', $searchTerm)
                             ->orWhere('alt', 'like', $searchTerm);
                });
            } else {
                $searchField = $request->input('searchField');
                $query->where($searchField, 'like', $searchTerm);
            }
        }



        // Ordenação
        $query->orderBy($sortField, $sortDirection);

        $banners = $query->paginate($itemsPerPage);

        Log::info('Consulta de Banner executada com sucesso.');

        return response()->json($banners);
    } catch (\Exception $e) {
        Log::error('Erro no processamento da solicitação: ' . $e->getMessage());
        return response()->json(['error' => 'Internal Server Error'], 500);
    }
}

    public function show($bannerId)
    {
        try {
            $banner = Banner::findOrFail($bannerId);
            Log::info('Consulta de Banner específico executada com sucesso.');
            return response()->json($banner);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());
            return response()->json(['error' => 'Banner não encontrado'], 404);
        }
    }

    public function updateSlide(Request $request, $bannerId)
    {
        try {
            $banner = Banner::findOrFail($bannerId);
            $banner->slide = $request->input('slide');
            $banner->save();

            Log::info("Banner ID {$bannerId} atualizado para slide: {$banner->slide}");
            return response()->json(['slide' => $banner->slide]);
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo slide: ' . $e->getMessage());
            return response()->json(['error' => 'Erro ao atualizar o Banner'], 500);
        }
    }

    public function updateBanner(Request $request, $bannerId)
    {
        try {
            $banner = Banner::findOrFail($bannerId);
            $banner->banner = $request->input('banner');
            $banner->save();

            Log::info("Banner ID {$bannerId} atualizado para banner: {$banner->banner}");
            return response()->json(['banner' => $banner->banner]);
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo banner: ' . $e->getMessage());
            return response()->json(['error' => 'Erro ao atualizar o Banner'], 500);
        }
    }


    public function updateDiscontinued(Request $request, $bannerId)
    {
        try {
            $banner = Banner::findOrFail($bannerId);
            $banner->discontinued = $request->input('discontinued');
            $banner->save();

            Log::info("Banner ID {$bannerId} atualizado para discontinued: {$banner->discontinued}");
            return response()->json(['discontinued' => $banner->discontinued]);
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo discontinued: ' . $e->getMessage());
            return response()->json(['error' => 'Erro ao atualizar o Banner'], 500);
        }
    }

    public function updateDeleted(Request $request, $bannerId)
    {
        try {
            // Busca o Parceiro, incluindo os deletados (soft deletes)
            $banner = Banner::withTrashed()->findOrFail($bannerId);

            // Verifica se o campo 'deleted' está presente na requisição
            if ($request->has('deleted')) {
                $updatedDeleted = (bool) $request->input('deleted');

                // Se 'deleted' for true, deleta o Parceiro (soft delete)
                if ($updatedDeleted) {
                    $banner->delete();
                } else {
                    // Se 'deleted' for false, restaura o Parceiro
                    $banner->restore();
                }

                // Log da operação realizada
                Log::info("Banner ID {$bannerId} atualizado para deleted: {$updatedDeleted}");

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
            return response()->json(['error' => 'Erro ao atualizar o Banner'], 500);
        }
    }
}

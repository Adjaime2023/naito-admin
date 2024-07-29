<?php

namespace App\Http\Controllers\Site\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Partner;
use Illuminate\Support\Facades\Log;

class SitePartnerApiController extends Controller
{
    public function sitePartner(Request $request)
{
    try {
        $sortField = $request->input('sortField', 'name');
        $sortDirection = $request->input('sortDirection', 'asc');
        $itemsPerPage = $request->input('itemsPerPage', 10);

        $query = Partner::query();
        $query->where('discontinued', false);


        // Filtro de Parceiros descontinuados
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

        // Filtro de pesquisa
        if ($request->has('searchTerm')) {
            $searchTerm = '%' . $request->input('searchTerm') . '%';
            if ($request->input('searchField') === null) {
                $query->where(function ($subquery) use ($searchTerm) {
                    $subquery->orWhere('name', 'like', $searchTerm)
                             ->orWhere('contact', 'like', $searchTerm)
                             ->orWhere('email', 'like', $searchTerm)
                             ->orWhere('city', 'like', $searchTerm)
                             ->orWhere('uf', 'like', $searchTerm);
                });
            } else {
                $searchField = $request->input('searchField');
                $query->where($searchField, 'like', $searchTerm);
            }
        }

        // Adicionar mais filtros
        if ($request->has('city')) {
            $query->where('city', $request->input('city'));
        }

        if ($request->has('email')) {
            $query->where('email', 'like', '%' . $request->input('email') . '%');
        }

        if ($request->has('phone')) {
            $query->where('phone', 'like', '%' . $request->input('phone') . '%');
        }

        if ($request->has('cep')) {
            $query->where('cep', $request->input('cep'));
        }

        if ($request->has('whatsapp')) {
            $query->where('whatsapp', 'like', '%' . $request->input('whatsapp') . '%');
        }

        // Ordenação
        $query->orderBy($sortField, $sortDirection);

        $partners = $query->paginate($itemsPerPage);

        Log::info('Consulta de Partner executada com sucesso.');

        return response()->json($partners);
    } catch (\Exception $e) {
        Log::error('Erro no processamento da solicitação: ' . $e->getMessage());
        return response()->json(['error' => 'Internal Server Error'], 500);
    }
}

    public function show($partnerId)
    {
        try {
            $partner = Partner::findOrFail($partnerId);
            Log::info('Consulta de Partner específico executada com sucesso.');
            return response()->json($partner);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());
            return response()->json(['error' => 'Partner não encontrado'], 404);
        }
    }

    public function updateDiscontinued(Request $request, $partnerId)
    {
        try {
            $partner = Partner::findOrFail($partnerId);
            $partner->discontinued = $request->input('discontinued');
            $partner->save();

            Log::info("Partner ID {$partnerId} atualizado para discontinued: {$partner->discontinued}");
            return response()->json(['discontinued' => $partner->discontinued]);
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo discontinued: ' . $e->getMessage());
            return response()->json(['error' => 'Erro ao atualizar o Partner'], 500);
        }
    }

    public function updateDeleted(Request $request, $partnerId)
    {
        try {
            // Busca o Parceiro, incluindo os deletados (soft deletes)
            $partner = Partner::withTrashed()->findOrFail($partnerId);

            // Verifica se o campo 'deleted' está presente na requisição
            if ($request->has('deleted')) {
                $updatedDeleted = (bool) $request->input('deleted');

                // Se 'deleted' for true, deleta o Parceiro (soft delete)
                if ($updatedDeleted) {
                    $partner->delete();
                } else {
                    // Se 'deleted' for false, restaura o Parceiro
                    $partner->restore();
                }

                // Log da operação realizada
                Log::info("Fornecedor ID {$partnerId} atualizado para deleted: {$updatedDeleted}");

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
            return response()->json(['error' => 'Erro ao atualizar o Fornecedor'], 500);
        }
    }
}

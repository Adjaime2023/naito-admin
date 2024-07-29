<?php

namespace App\Http\Controllers\Site\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Products\Group;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;

class SiteGroupApiController extends Controller
{
    public function siteGroup(Request $request)
    {
        Log::info('Método Grupo chamado.');

        try {
            $query = Group::query();

            // Filtrar apenas grupos não descontinuados
            $query->where('discontinued', false);

            // Incluir grupos deletados se solicitado
            if ($request->has('deleted')) {
                $query->withTrashed()->whereNotNull('deleted_at');
            } else {
                $query->whereNull('deleted_at');
            }

            $query->orderBy('id', 'desc');
            $groups = $query->get();

            Log::info('Consulta de Grupo executada com sucesso. Grupos encontrados: ' . $groups->count());

            return Response::json($groups);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());
            return Response::json(['error' => 'Internal Server Error'], 500);
        }
    }
}

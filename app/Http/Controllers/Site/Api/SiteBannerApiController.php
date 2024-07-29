<?php

namespace App\Http\Controllers\Site\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Banner;
use Illuminate\Support\Facades\Log;

class SiteBannerApiController extends Controller
{
    public function siteBanner(Request $request)
    {
        Log::info('Método slide chamado.');
        try {
            $itemsPerPage = $request->input('itemsPerPage', 1);

            $query = Banner::query();
            $query->where('banner', true)
                  ->where('discontinued', false);

            if ($request->has('deleted')) {
                $query->withTrashed()->whereNotNull('deleted_at');
            } else {
                $query->whereNull('deleted_at');
            }

            $query->orderBy('date', 'desc');
            $banners = $query->paginate($itemsPerPage);

            Log::info('Consulta de Banner executada com sucesso.');

            return response()->json($banners);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());
            return response()->json(['error' => 'Internal Server Error'], 500);
        }
    }
}

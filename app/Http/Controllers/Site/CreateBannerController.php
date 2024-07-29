<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Banner;
use Inertia\Inertia;
use Illuminate\Support\Facades\Log;

class CreateBannerController extends Controller
{

    public function create()
    {
        return Inertia::render('Ecommerce/WebsiteManagement/Banners/Create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'alt' => 'required|string|unique:banners,alt',
            'title' => 'required|string',
            'description' => 'nullable|string',
            'description2' => 'nullable|string',
            'url' => 'nullable|string',
            'horizontal_alignment' => 'nullable|string',
            'vertical_alignment' => 'nullable|string',
            'date' =>  'required|date_format:Y-m-d',
        ]);

        try {

            $banner = Banner::create([
                'alt' => $validated['alt'],
                'title' => $validated['title'],
                'description' => $validated['description'],
                'description2' => $validated['description2'],
                'url' => $validated['url'],
                'horizontal_alignment' => $validated['horizontal_alignment'],
                'vertical_alignment' => $validated['vertical_alignment'],
                'date' => $validated['date'],
            ]);


            Log::debug('Banner criado:', $banner->toArray()); // Converter para array


            return redirect()->route('banner.edit', $banner->id)
                ->with('flash.banner', 'Banner criado com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            Log::error('Erro ao salvar Banner: ' . $e->getMessage());
            return redirect()->back()
                ->with('danger', 'Erro ao criar o Banner: ' . $e->getMessage());
        }
    }
}

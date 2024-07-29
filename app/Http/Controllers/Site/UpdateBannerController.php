<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class UpdateBannerController extends Controller
{
    public function edit($id)
    {
        $banner = Banner::findOrFail($id);
        return Inertia::render('Ecommerce/WebsiteManagement/Banners/Update', ['banner' => $banner]);
    }

    public function update(Request $request, $id)
    {
        Log::debug('Update request received', ['id' => $id, 'data' => $request->all()]);

        $validatedData = $request->validate([
            'alt' => 'required|string|max:255|unique:banners,alt,' . $id,
            'title' => 'required|string',
            'description' => 'nullable|string',
            'description2' => 'nullable|string',
            'url' => 'nullable|string',
            'horizontal_alignment' => 'nullable|string',
            'vertical_alignment' => 'nullable|string',
            'date' => 'required|date_format:Y-m-d',

        ]);

        try {
            $banner = Banner::findOrFail($id);
            Log::debug('Validated data', $validatedData);

            // Atualizando os dados do banner utilizando atribuição em massa
            $banner->update($validatedData);
            Log::info('Banner updated successfully', ['id' => $id]);

            return Redirect::route('banner.edit', $banner->id)
                ->with('flash.banner', 'Banner atualizado com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            Log::error('Error updating banner', ['error' => $e->getMessage()]);
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar o Banner: ' . $e->getMessage());
        }
    }


    public function updateImageLogoLight(Request $request, $id)
    {
        $validated = $request->validate([
            'logo_light' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        try {
            $banner = Banner::findOrFail($id);

            // Se houver uma nova imagem, processa o upload
            if ($request->hasFile('logo_light')) {
                $image = $request->file('logo_light');

                // Remove espaços e caracteres indesejados do nome da Logo light
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $banner->title));

                // Obtém a extensão do arquivo original
                $extension = $image->getClientOriginalExtension();

                // Cria o nome do arquivo usando o nome sanitizado da Logo light
                $filename = $sanitizedName . '_' . 'logo_light' . '_' . date('YmdHi') . '.' . $extension;

                // Salva o arquivo no sistema de arquivos configurado (usando o disco 'public' por padrão)
                $path = $image->storeAs('banners/' . $banner->id, $filename, 'public');

                // Remove a imagem antiga se existir
                if ($banner->logo_light && $banner->logo_light !== 'images/default.png') {
                    Storage::disk('public')->delete($banner->logo_light);
                }

                // Atualiza o caminho da imagem na Logo light
                $banner->logo_light = $path;
                $banner->save();
            }

            return Redirect::route('banner.edit', $banner->id)
                ->with('flash.banner', 'Imagem da Logo light atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da Logo light: ' . $e->getMessage());
        }
    }


    public function updateImageLogoDark(Request $request, $id)
    {
        $validated = $request->validate([
            'logo_dark' => 'required|image|mimes:jpeg,png,jpg,gif,svg,ico|max:2048',
        ]);

        try {
            $banner = Banner::findOrFail($id);

            if ($request->hasFile('logo_dark')) {
                $image = $request->file('logo_dark');
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_',  $banner->title));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . 'logo_dark' . '_' . date('YmdHi') . '.' . $extension;
                $path = $image->storeAs('banners/' . $banner->id, $filename, 'public');


                // Verificar se a imagem antiga existe e não é a imagem padrão
                if ($banner->logo_dark && $banner->logo_dark !== 'images/default.png' && Storage::disk('public')->exists($banner->logo_dark)) {
                    Storage::disk('public')->delete($banner->logo_dark);
                }


                $banner->logo_dark = $path;
                $banner->save();
            }

            return Redirect::route('banner.edit', $banner->id)
                ->with('flash.banner', 'Imagem da Logo Dark atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da Logo Dark: ' . $e->getMessage());
        }
    }

    public function updateImageMobile(Request $request, $id)
    {
        // Validação do campo image_url_mobile
        $validated = $request->validate([
            'image_url_mobile' => 'required|image|mimes:jpeg,png,jpg,gif,svg,ico|max:2048',
        ]);

        try {
            // Encontrar o banner pelo ID
            $banner = Banner::findOrFail($id);

            // Verificar se há um arquivo de imagem
            if ($request->hasFile('image_url_mobile')) {
                $image = $request->file('image_url_mobile');

                // Sanitizar o nome do arquivo
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_',  $banner->title));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . 'image_url_mobile' . '_' . date('YmdHi') . '.' . $extension;

                // Armazenar a nova imagem
                $path = $image->storeAs('banners/' . $banner->id, $filename, 'public');

                // Remover a imagem antiga se existir e não for a imagem padrão
                if ($banner->image_url_mobile && $banner->image_url_mobile !== 'images/default.png') {
                    Storage::disk('public')->delete($banner->image_url_mobile);
                }

                // Atualizar o caminho da imagem no banner
                $banner->image_url_mobile = $path;
                $banner->save();
            }

            // Redirecionar com mensagem de sucesso
            return Redirect::route('banner.edit', $banner->id)
                ->with('flash.banner', 'Imagem Mobile atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            // Redirecionar com mensagem de erro em caso de exceção
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem Mobile: ' . $e->getMessage());
        }
    }

    public function updateImageTablet(Request $request, $id)
    {
        // Validação do campo image_url_tablet
        $validated = $request->validate([
            'image_url_tablet' => 'required|image|mimes:jpeg,png,jpg,gif,svg,ico|max:2048',
        ]);

        try {
            // Encontrar o banner pelo ID
            $banner = Banner::findOrFail($id);

            // Verificar se há um arquivo de imagem
            if ($request->hasFile('image_url_tablet')) {
                $image = $request->file('image_url_tablet');

                // Sanitizar o nome do arquivo
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_',  $banner->title));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . 'image_url_tablet' . '_' . date('YmdHi') . '.' . $extension;

                // Armazenar a nova imagem
                $path = $image->storeAs('banners/' . $banner->id, $filename, 'public');

                // Remover a imagem antiga se existir e não for a imagem padrão
                if ($banner->image_url_tablet && $banner->image_url_tablet !== 'images/default.png') {
                    Storage::disk('public')->delete($banner->image_url_tablet);
                }

                // Atualizar o caminho da imagem no banner
                $banner->image_url_tablet = $path;
                $banner->save();
            }

            // Redirecionar com mensagem de sucesso
            return Redirect::route('banner.edit', $banner->id)
                ->with('flash.banner', 'Imagem Tablet atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            // Redirecionar com mensagem de erro em caso de exceção
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem Tablet: ' . $e->getMessage());
        }
    }


    public function updateImageLaptop(Request $request, $id)
    {
        $validated = $request->validate([
            'image_url_laptop' => 'required|image|mimes:jpeg,png,jpg,gif,svg,ico|max:2048',
        ]);

        try {
            $banner = Banner::findOrFail($id);

            if ($request->hasFile('image_url_laptop')) {
                $image = $request->file('image_url_laptop');
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_',  $banner->title));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . 'image_url_laptop' . '_' . date('YmdHi') . '.' . $extension;
                $path = $image->storeAs('banners/' . $banner->id, $filename, 'public');

                if ($banner->image_url_laptop && $banner->image_url_laptop !== 'images/default.png') {
                    Storage::disk('public')->delete($banner->image_url_laptop);
                }

                $banner->image_url_laptop = $path;
                $banner->save();
            }

            return Redirect::route('banner.edit', $banner->id)
                ->with('flash.banner', 'Imagem Laptop atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem Laptop: ' . $e->getMessage());
        }
    }


    public function updateImageDesktop(Request $request, $id)
    {
        // Validação do campo image_url_desktop
        $validated = $request->validate([
            'image_url_desktop' => 'required|image|mimes:jpeg,png,jpg,gif,svg,ico|max:2048',
        ]);

        try {
            // Encontrar o banner pelo ID
            $banner = Banner::findOrFail($id);

            // Verificar se há um arquivo de imagem
            if ($request->hasFile('image_url_desktop')) {
                $image = $request->file('image_url_desktop');

                // Sanitizar o nome do arquivo
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_',  $banner->title));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . 'image_url_desktop' . '_' . date('YmdHi') . '.' . $extension;

                // Armazenar a nova imagem
                $path = $image->storeAs('banners/' . $banner->id, $filename, 'public');

                // Remover a imagem antiga se existir e não for a imagem padrão
                if ($banner->image_url_desktop && $banner->image_url_desktop !== 'images/default.png') {
                    Storage::disk('public')->delete($banner->image_url_desktop);
                }

                // Atualizar o caminho da imagem no banner
                $banner->image_url_desktop = $path;
                $banner->save();
            }

            // Redirecionar com mensagem de sucesso
            return Redirect::route('banner.edit', $banner->id)
                ->with('flash.banner', 'Imagem Desktop atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            // Redirecionar com mensagem de erro em caso de exceção
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem Desktop: ' . $e->getMessage());
        }
    }
}

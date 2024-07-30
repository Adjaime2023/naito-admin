<?php


namespace App\Http\Controllers\Company;

use App\Http\Controllers\Controller;
use App\Models\Company;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;
use Illuminate\Support\Facades\Log;

class UpdateCompanyController extends Controller
{
    public function edit($id)
    {
        $company = Company::findOrFail($id);

        return Inertia::render('Ecommerce/Admin/Company/Update', ['company' => $company]);
    }


    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'contact' => 'required|string',
            'support_message' => 'nullable|string',
            'description' => 'nullable|string',
            'email' => 'nullable|string|email',
            'whatsapp' => 'nullable|string',
            'phone' => 'nullable|string',
            'website' => 'nullable|string',
            'facebook' => 'nullable|string',
            'instagram' => 'nullable|string',
            'x' => 'nullable|string',
            'tiktok' => 'nullable|string',
            'cep' => 'nullable|string|regex:/^[0-9]{5}-[0-9]{3}$/',
            'city' => 'nullable|string',
            'uf' => 'required|string|max:2',
            'address' => 'nullable|string',
            'number' => 'nullable|string',
            'complement' => 'nullable|string',
            'neighborhood' => 'nullable|string',
            'latitude' => 'nullable|string',
            'longitude' => 'nullable|string',
            'portifolio' => 'nullable|string',
            'mission' => 'nullable|string',
            'vision' => 'nullable|string',
            'values' => 'nullable|string',
            'experience1' => 'nullable|string',
            'experience2' => 'nullable|string',
            'experience3' => 'nullable|string',
            'description1' => 'nullable|string',
            'link1' => 'nullable|string',
            'description2' => 'nullable|string',
            'link2' => 'nullable|string',
        ]);

        try {
            $company = Company::findOrFail($id);

            // Remover hífen do campo cep, se presente
            if (isset($validatedData['cep'])) {
                $validatedData['cep'] = str_replace('-', '', $validatedData['cep']);
            }

            // Adicione logs para verificar os dados validados e a instância do modelo
            Log::info('Validated Data:', $validatedData);
            Log::info('Company before update:', $company->toArray());

            $company->update($validatedData);

            // Adicione log para verificar a instância do modelo após a atualização
            Log::info('Company after update:', $company->toArray());

            return Redirect::route('company.edit', $company->id)
                ->with('flash.banner', 'Empresa atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            // Adicione log para capturar erros
            Log::error('Error updating company:', ['error' => $e->getMessage()]);

            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Empresa: ' . $e->getMessage());
        }
    }




    public function updateImageFavicon(Request $request, $id)
    {
        $validated = $request->validate([
            'favicon' => 'required|image|mimes:jpeg,png,jpg,gif,svg,ico|max:2048',
        ]);

        try {
            $company = Company::findOrFail($id);

            if ($request->hasFile('favicon')) {
                $image = $request->file('favicon');
                $filename = 'favicon.png';
                $path = 'images/' . $filename;

                // Remove old favicon if it exists
                if ($company->favicon && Storage::disk('public')->exists($company->favicon)) {
                    Storage::disk('public')->delete($company->favicon);
                }

                // Save the new favicon
                $image->storeAs('images', $filename, 'public');

                // Update company's favicon path
                $company->favicon = $path;
                $company->save();
            }

            return Redirect::route('company.edit', $company->id)
                ->with('flash.banner', 'Imagem do Favicon atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem do Favicon: ' . $e->getMessage());
        }
    }



    public function updateImageLogoLight(Request $request, $id)
    {
        // Validação do arquivo de imagem
        $validated = $request->validate([
            'logo_light' => 'required|image|mimes:jpeg,png,jpg,gif,svg,ico|max:2048',
        ]);

        try {
            // Encontrar a empresa pelo ID
            $company = Company::findOrFail($id);

            // Verifica se o request contém um arquivo de imagem
            if ($request->hasFile('logo_light')) {
                $image = $request->file('logo_light');

                // Define o nome do arquivo e o caminho para salvar a imagem
                $filename = 'logo_light_' . time() . '.' . $image->getClientOriginalExtension();
                $path = 'images/' . $filename;

                // Checa se há uma imagem existente e se ela não é a imagem padrão
                if ($company->logo_light && Storage::disk('public')->exists($company->logo_light)) {
                    if ($company->logo_light !== 'images/default.png') {
                        Storage::disk('public')->delete($company->logo_light);
                    }
                }

                // Salva a nova imagem
                $image->storeAs('images', $filename, 'public');

                // Atualiza o caminho da imagem da empresa
                $company->logo_light = $path;
                $company->save();
            }

            return Redirect::route('company.edit', $company->id)
                ->with('flash.banner', 'Imagem da Logo Light atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da Logo Light: ' . $e->getMessage());
        }
    }

    public function updateImageLogoDark(Request $request, $id)
    {
        // Validação do arquivo de imagem
        $validated = $request->validate([
            'logo_dark' => 'required|image|mimes:jpeg,png,jpg,gif,svg,ico|max:2048',
        ]);

        try {
            // Encontrar a empresa pelo ID
            $company = Company::findOrFail($id);

            // Verifica se o request contém um arquivo de imagem
            if ($request->hasFile('logo_dark')) {
                $image = $request->file('logo_dark');

                // Define o nome do arquivo e o caminho para salvar a imagem
                $filename = 'logo_dark_' . time() . '.' . $image->getClientOriginalExtension();
                $path = 'images/' . $filename;

                // Checa se há uma imagem existente e se ela não é a imagem padrão
                if ($company->logo_dark && Storage::disk('public')->exists($company->logo_dark)) {
                    if ($company->logo_dark !== 'images/default.png') {
                        Storage::disk('public')->delete($company->logo_dark);
                    }
                }

                // Salva a nova imagem
                $image->storeAs('images', $filename, 'public');

                // Atualiza o caminho da imagem da empresa
                $company->logo_dark = $path;
                $company->save();
            }

            return Redirect::route('company.edit', $company->id)
                ->with('flash.banner', 'Imagem da Logo Dark atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da Logo Dark: ' . $e->getMessage());
        }
    }

    public function updateImageAbout(Request $request, $id)
    {
        $validated = $request->validate([
            'image_about' => 'required|image|mimes:jpeg,png,jpg,gif,svg,ico|max:2048',
        ]);

        try {
            $company = Company::findOrFail($id);

            if ($request->hasFile('image_about')) {
                $image = $request->file('image_about');
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $company->name));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . 'image_about' . '_' . date('YmdHi') . '.' . $extension;
                $path = $image->storeAs('company/' . $company->id, $filename, 'public');

                if ($company->image_about && $company->image_about !== 'images/default.png') {
                    Storage::disk('public')->delete($company->image_about);
                }

                $company->image_about = $path;
                $company->save();
            }

            return Redirect::route('company.edit', $company->id)
                ->with('flash.banner', 'Imagem sobre nós atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem sobre nós: ' . $e->getMessage());
        }
    }



    public function updateImageAboutRight(Request $request, $id)
    {
        $validated = $request->validate([
            'image_about_right' => 'required|image|mimes:jpeg,png,jpg,gif,svg,ico|max:2048',
        ]);

        try {
            $company = Company::findOrFail($id);

            if ($request->hasFile('image_about_right')) {
                $image = $request->file('image_about_right');
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $company->name));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . 'image_about_right' . '_' . date('YmdHi') . '.' . $extension;
                $path = $image->storeAs('company/' . $company->id, $filename, 'public');

                if ($company->image_about_right && $company->image_about_right !== 'images/default.png') {
                    Storage::disk('public')->delete($company->image_about_right);
                }

                $company->image_about_right = $path;
                $company->save();
            }

            return Redirect::route('company.edit', $company->id)
                ->with('flash.banner', 'Imagem da ImageAboutRight atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da ImageAboutRight: ' . $e->getMessage());
        }
    }

    public function updateImageFooter(Request $request, $id)
    {
        $validated = $request->validate([
            'image_footer' => 'required|image|mimes:jpeg,png,jpg,gif,svg,ico|max:2048',
        ]);

        try {
            $company = Company::findOrFail($id);

            if ($request->hasFile('image_footer')) {
                $image = $request->file('image_footer');
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $company->name));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . 'image_footer' . '_' . date('YmdHi') . '.' . $extension;
                $path = $image->storeAs('company/' . $company->id, $filename, 'public');

                if ($company->image_footer && $company->image_footer !== 'images/default.png') {
                    Storage::disk('public')->delete($company->image_footer);
                }

                $company->image_footer = $path;
                $company->save();
            }

            return Redirect::route('company.edit', $company->id)
                ->with('flash.banner', 'Imagem do Rodapé atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da Rodapé: ' . $e->getMessage());
        }
    }

    public function updateImageFooterBotton(Request $request, $id)
    {
        $validated = $request->validate([
            'image_footer_botton' => 'required|image|mimes:jpeg,png,jpg,gif,svg,ico|max:2048',
        ]);

        try {
            $company = Company::findOrFail($id);

            if ($request->hasFile('image_footer_botton')) {
                $image = $request->file('image_footer_botton');
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $company->name));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . 'image_footer_botton' . '_' . date('YmdHi') . '.' . $extension;
                $path = $image->storeAs('company/' . $company->id, $filename, 'public');

                if ($company->image_footer_botton && $company->image_footer_botton !== 'images/default.png') {
                    Storage::disk('public')->delete($company->image_footer_botton);
                }

                $company->image_footer_botton = $path;
                $company->save();
            }

            return Redirect::route('company.edit', $company->id)
                ->with('flash.banner', 'Imagem da rodapé abaixo atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da rodapé abaixo: ' . $e->getMessage());
        }
    }
}

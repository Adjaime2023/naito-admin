<?php

namespace App\Http\Controllers\Company;

use App\Http\Controllers\Controller;
use App\Models\Company;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

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
            'email' => 'nullable|string',
            'whatsapp' => 'nullable|string',
            'phone' => 'nullable|string',
            'website' => 'nullable|string',
            'facebook' => 'nullable|string',
            'instagram' => 'nullable|string',
            'x' => 'nullable|string',
            'tiktok' => 'nullable|string',
            'cep' => 'nullable|string',
            'city' => 'nullable|string',
            'uf' => 'required|string|max:2',
            'address' => 'nullable|string',
            'number' => 'nullable|string',
            'complement' => 'nullable|string',
            'neighborhood' => 'nullable|string',
            'latitude' => 'nullable|string',
            'longitude' => 'nullable|string',
            'portifolio'  => 'nullable|string',
            'mission' => 'nullable|string',
            'vision' => 'nullable|string',
            'values' => 'nullable|string',
            'experience1' => 'nullable|string',
            'experience3' => 'nullable|string',
            'experience3' => 'nullable|string',
            'image_footer' => 'nullable|string',
            'description1'=> 'nullable|string',
            'link1' => 'nullable|string',
            'image_footer_botton'=> 'nullable|string',
            'description2'=> 'nullable|string',
            'link2' => 'nullable|string',
        ]);

        try {
            $company = Company::findOrFail($id);
            $company->update($validatedData);

            return Redirect::route('company.edit', $company->id)
                ->with('flash.banner', 'Empresa atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
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
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $company->name));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . 'favicon' . '_' . date('YmdHi') . '.' . $extension;
                $path = $image->storeAs('company/' . $company->id, $filename, 'public');

                if ($company->favicon && $company->favicon!== 'images/favicon_naito.png') {
                    Storage::disk('public')->delete($company->favicon);
                }

                $company->favicon = $path;
                $company->save();
            }

            return Redirect::route('company.edit', $company->id)
                ->with('flash.banner', 'Imagem da Favicon atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da Favicon: ' . $e->getMessage());
        }
    }

    public function updateImageLogoLight(Request $request, $id)
    {
        $validated = $request->validate([
            'logo_light' => 'required|image|mimes:jpeg,png,jpg,gif,svg,ico|max:2048',
        ]);

        try {
            $company = Company::findOrFail($id);

            if ($request->hasFile('logo_light')) {
                $image = $request->file('logo_light');
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $company->name));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . 'logo_light' . '_' . date('YmdHi') . '.' . $extension;
                $path = $image->storeAs('company/' . $company->id, $filename, 'public');

                if ($company->logo_light && $company->logo_light !== 'images/default.png') {
                    Storage::disk('public')->delete($company->logo_light);
                }

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
        $validated = $request->validate([
            'logo_dark' => 'required|image|mimes:jpeg,png,jpg,gif,svg,ico|max:2048',
        ]);

        try {
            $company = Company::findOrFail($id);

            if ($request->hasFile('logo_dark')) {
                $image = $request->file('logo_dark');
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $company->name));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . 'logo_dark' . '_' . date('YmdHi') . '.' . $extension;
                $path = $image->storeAs('company/' . $company->id, $filename, 'public');

                if ($company->logo_dark && $company->logo_dark !== 'images/default.png') {
                    Storage::disk('public')->delete($company->logo_dark);
                }

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

                if ($company->image_about && $company->image_about!== 'images/default.png') {
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

                if ($company->image_about_right && $company->image_about_right!== 'images/default.png') {
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

                if ($company->image_footer && $company->image_footer!== 'images/default.png') {
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

                if ($company->image_footer_botton && $company->image_footer_botton!== 'images/default.png') {
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

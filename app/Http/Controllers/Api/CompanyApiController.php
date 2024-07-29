<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Company;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\Log;

class CompanyApiController extends Controller
{
    public function showCompany()
    {
        try {
            $companyId = 1; // ID da empresa a ser exibida
            $company = Company::findOrFail($companyId);
            Log::info('Consulta de Company específico com ID 1 executada com sucesso.');

            // Defina os dados específicos a serem enviados na resposta
            $companyData = [
                'name' => $company->name,
                'address' => $company->address,
                'city' => $company->city,
                'number' => $company->number,
                'neighborhood' => $company->neighborhood,
                'uf' => $company->uf,
                'cep' => $company->cep,
                'latitude' => $company->latitude,
                'longitude' => $company->longitude,
                'nivel_zoon' => $company->nivel_zoon,
                'contact' => $company->contact,
                'email'=> $company->email,
                'support_message'=> $company->support_message,
                'description'=> $company->description,
                'slogan'=> $company->slogan,
                'portifolio'=> $company->portifolio,
                'mission'=> $company->mission,
                'vision'=> $company->vision,
                'values'=> $company->values,
                'image_about' =>  $company->image_about,
                'image_about_right' => $company->image_about_right,
                'experience1' =>  $company->experience1,
                'experience2' =>  $company->experience2,
                'experience3' =>  $company->experience3,
                'website'=> $company->website,
                'phone'=> $company->phone,
                'whatsapp'=> $company->whatsapp,
                'facebook'=> $company->facebook,
                'x'=> $company->x,
                'tictok'=> $company->tictok,
                'instagram'=> $company->instagram,                   
                'favicon'=> $company->favicon,
                'logo_light'=> $company->logo_light,
                'logo_dark'=> $company->logo_dark,
                'image_footer'=> $company->image_footer,
                'description1'=> $company->description1,
                'link1' => $company->link1,
                'image_footer_botton'=> $company->image_footer_botton,
                'description2'=> $company->description2,
                'link2'=> $company->link2,
                
            ];

            return response()->json(['data' => $companyData]);
        } catch (ModelNotFoundException $e) {
            Log::error('Company não encontrado: ' . $e->getMessage());
            return response()->json(['error' => 'Company não encontrado'], 404);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());
            return response()->json(['error' => 'Erro interno'], 500);
        }
    }
}

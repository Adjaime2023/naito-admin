<?php
namespace App\Http\Controllers\Movements;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use SimpleXMLElement;
use Inertia\Inertia;

class NfeImportController extends Controller
{
    public function import(Request $request)
    {
        $request->validate([
            'xml_file' => 'required|file|mimes:xml',
        ]);

        try {
            $xmlContent = file_get_contents($request->file('xml_file')->getRealPath());
            $xml = new SimpleXMLElement($xmlContent);

            $data = [
                'chave_acesso' => (string) $xml->NFe->infNFe->ide->cNF,
                'numero' => (string) $xml->NFe->infNFe->ide->nNF,
                'serie' => (string) $xml->NFe->infNFe->ide->serie,
                'data_emissao' => (string) $xml->NFe->infNFe->ide->dhEmi,
                'data_recebimento' => (string) $xml->protNFe->infProt->dhRecbto,
                'nome_emitente' => (string) $xml->NFe->infNFe->emit->xNome,
                'cnpj_emitente' => (string) $xml->NFe->infNFe->emit->CNPJ,
                'nome_destinatario' => (string) $xml->NFe->infNFe->dest->xNome,
                'cnpj_destinatario' => (string) $xml->NFe->infNFe->dest->CNPJ,
                'valor_total' => (float) $xml->NFe->infNFe->total->ICMSTot->vNF,
                'valor_icms' => (float) $xml->NFe->infNFe->total->ICMSTot->vICMS,
                'items' => []
            ];

            foreach ($xml->NFe->infNFe->det as $item) {
                $data['items'][] = [
                    'codigo_produto' => (string) $item->prod->cProd,
                    'descricao' => (string) $item->prod->xProd,
                    'ncm' => (string) $item->prod->NCM,
                    'cst' => (string) $item->imposto->ICMS->CST,
                    'cfop' => (string) $item->prod->CFOP,
                    'unidade' => (string) $item->prod->uCom,
                    'quantidade' => (float) $item->prod->qCom,
                    'valor_unitario' => (float) $item->prod->vUnCom,
                    'valor_total' => (float) $item->prod->vProd,
                ];
            }

            // Return an Inertia response with the data
            return Inertia::render('Ecommerce/Movements/Entries/Create', [
                'data' => $data
            ]);
        } catch (\Exception $e) {
            Log::error('Erro ao processar o XML da NF-e: ' . $e->getMessage());
            return back()->withErrors(['xml_file' => 'Erro ao processar o XML da NF-e.']);
        }
    }
}

<?php

namespace App\Http\Controllers\Movements;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Models\Movements\NfeEntrada;
use App\Models\Movements\NfeItem;
use App\Models\Product;
use SimpleXMLElement;
use Inertia\Inertia;

class CreateNfeEntradaController extends Controller
{
    public function create()
    {
        return Inertia::render('Ecommerce/Movements/Entries/Create', [
            'data' => null,
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'chave_acesso' => 'required|string',
            'numero' => 'required|integer',
            'serie' => 'required|string',
            'data_emissao' => 'required|date',
            'data_recebimento' => 'required|date',
            'nome_emitente' => 'required|string',
            'cnpj_emitente' => 'required|string',
            'nome_destinatario' => 'required|string',
            'cnpj_destinatario' => 'required|string',
            'valor_total' => 'required|numeric',
            'valor_icms' => 'required|numeric',
            'items' => 'required|array',
            'items.*.product_id' => 'nullable|exists:products,id',
            'items.*.codigo_produto' => 'required|string',
            'items.*.descricao' => 'required|string',
            'items.*.ncm' => 'required|string',
            'items.*.cst' => 'required|string',
            'items.*.cfop' => 'required|string',
            'items.*.unidade' => 'required|string',
            'items.*.quantidade' => 'required|numeric',
            'items.*.valor_unitario' => 'required|numeric',
            'items.*.valor_total' => 'required|numeric',
            'items.*.action_user' => 'required|string',
            'items.*.discontinued' => 'required|boolean',
        ]);

        DB::beginTransaction();
        try {
            $nfe = NfeEntrada::create($request->only([
                'chave_acesso', 'numero', 'serie', 'data_emissao', 'data_recebimento',
                'nome_emitente', 'cnpj_emitente', 'nome_destinatario', 'cnpj_destinatario',
                'valor_total', 'valor_icms'
            ]));

            foreach ($request->items as $item) {
                $nfe->items()->create($item);
            }

            DB::commit();
            return redirect()->route('nfe-entrada.create')->with('success', 'Nota Fiscal de Entrada criada com sucesso.');
        } catch (\Exception $e) {
            DB::rollback();
            Log::error('Erro ao criar Nota Fiscal de Entrada: ' . $e->getMessage());
            return redirect()->route('nfe-entrada.create')->with('error', 'Erro ao criar Nota Fiscal de Entrada.');
        }
    }

    public function import(Request $request)
    {
        $request->validate([
            'xml_file' => 'required|file|mimes:xml',
        ]);

        try {
            $xmlContent = file_get_contents($request->file('xml_file')->getRealPath());
            $xml = new SimpleXMLElement($xmlContent);

            $data = [
                'chave_acesso' => (string) ($xml->NFe->infNFe->ide->cNF ?? ''),
                'numero' => (string) ($xml->NFe->infNFe->ide->nNF ?? ''),
                'serie' => (string) ($xml->NFe->infNFe->ide->serie ?? ''),
                'data_emissao' => (string) ($xml->NFe->infNFe->ide->dhEmi ?? ''),
                'data_recebimento' => (string) ($xml->protNFe->infProt->dhRecbto ?? ''),
                'nome_emitente' => (string) ($xml->NFe->infNFe->emit->xNome ?? ''),
                'cnpj_emitente' => (string) ($xml->NFe->infNFe->emit->CNPJ ?? ''),
                'nome_destinatario' => (string) ($xml->NFe->infNFe->dest->xNome ?? ''),
                'cnpj_destinatario' => (string) ($xml->NFe->infNFe->dest->CNPJ ?? ''),
                'valor_total' => (float) ($xml->NFe->infNFe->total->ICMSTot->vNF ?? 0),
                'valor_icms' => (float) ($xml->NFe->infNFe->total->ICMSTot->vICMS ?? 0),
                'items' => []
            ];

            foreach ($xml->NFe->infNFe->det as $item) {
                $cst = '';
                if (isset($item->imposto->ICMS->ICMS00)) {
                    $cst = (string) $item->imposto->ICMS->ICMS00->CST;
                } elseif (isset($item->imposto->ICMS->ICMS10)) {
                    $cst = (string) $item->imposto->ICMS->ICMS10->CST;
                } 

                $data['items'][] = [
                    'product_id' => null, // Initially null, to be set manually if needed
                    'codigo_produto' => (string) ($item->prod->cProd ?? ''),
                    'descricao' => (string) ($item->prod->xProd ?? ''),
                    'ncm' => (string) ($item->prod->NCM ?? ''),
                    'cst' => $cst,
                    'cfop' => (string) ($item->prod->CFOP ?? ''),
                    'unidade' => (string) ($item->prod->uCom ?? ''),
                    'quantidade' => (float) ($item->prod->qCom ?? 0),
                    'valor_unitario' => (float) ($item->prod->vUnCom ?? 0),
                    'valor_total' => (float) ($item->prod->vProd ?? 0),
                    'action_user' => 'imported', // Assuming default action_user value
                    'discontinued' => false, // Assuming default discontinued value
                ];
            }

            return Inertia::render('Ecommerce/Movements/Entries/Create', [
                'data' => $data,
            ]);
        } catch (\Exception $e) {
            Log::error('Error processing XML: ' . $e->getMessage());
            return Inertia::render('Ecommerce/Movements/Entries/Create', [
                'data' => null,
                'error' => 'Error processing XML.',
            ]);
        }
    }
}

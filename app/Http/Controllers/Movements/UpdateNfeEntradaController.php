<?php
namespace App\Http\Controllers\Movements;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Models\Movements\NfeEntrada;
use App\Models\Movements\NfeItem;
use Inertia\Inertia;

class UpdateNfeEntradaController extends Controller
{
    public function edit($id)
    {
        $nfeEntrada = NfeEntrada::with('nfeItems')->findOrFail($id);
        //dd($nfeEntrada->toArray()); // Adicione esta linha
        return Inertia::render('Ecommerce/Movements/Entries/Update', [
            'nfeEntrada' => $nfeEntrada
        ]);
    }
    

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'chave_acesso' => 'required|string|max:255',
            'numero' => 'nullable|string',
            'serie' => 'nullable|string',
            'data_emissao' => 'nullable|string',
            'data_recebimento' => 'nullable|string',
            'nome_emitente' => 'nullable|string',
            'cnpj_emitente' => 'nullable|string',
            'nome_destinatario' => 'nullable|string',
            'cnpj_destinatario' => 'nullable|string',
            'valor_total' => 'nullable|numeric',
            'valor_icms' => 'nullable|numeric',
            'items' => 'required|array',
            'items.*.id' => 'nullable|exists:nfe_items,id',
            'items.*.codigo_produto' => 'required|string',
            'items.*.descricao' => 'required|string',
            'items.*.ncm' => 'nullable|string',
            'items.*.cst' => 'nullable|string',
            'items.*.cfop' => 'nullable|string',
            'items.*.unidade' => 'nullable|string',
            'items.*.quantidade' => 'required|numeric',
            'items.*.valor_unitario' => 'required|numeric',
            'items.*.valor_total' => 'required|numeric',
        ]);

        try {
            DB::transaction(function () use ($validated, $id) {
                $nfeEntrada = NfeEntrada::findOrFail($id);
                $nfeEntrada->update($validated);

                $itemIds = collect($validated['items'])->pluck('id')->filter()->all();
                NfeItem::where('nfe_entrada_id', $id)->whereNotIn('id', $itemIds)->delete();

                foreach ($validated['items'] as $item) {
                    if (isset($item['id'])) {
                        $nfeItem = NfeItem::findOrFail($item['id']);
                        $nfeItem->update($item);
                    } else {
                        $item['nfe_entrada_id'] = $nfeEntrada->id;
                        NfeItem::create($item);
                    }
                }
            });

            return redirect()->route('nfe.edit', $id)->with('success', 'Nfe atualizada com sucesso.');
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar Nfe: ' . $e->getMessage());
            return back()->withErrors(['error' => 'Erro ao atualizar Nfe.']);
        }
    }
}

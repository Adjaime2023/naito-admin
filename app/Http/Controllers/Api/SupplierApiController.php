<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Supplier;
use Illuminate\Support\Facades\Log;

class SupplierApiController extends Controller
{
    public function index(Request $request)
    {
        try {
            $sortField = $request->input('sortField', 'name');
            $sortDirection = $request->input('sortDirection', 'asc');
            $itemsPerPage = $request->input('itemsPerPage', 10);

            $query = Supplier::query()
                ->with(['user', 'supplierType'])
                ->leftJoin('users', 'suppliers.user_id', '=', 'users.id')
                ->leftJoin('supplier_types', 'suppliers.supplier_type_id', '=', 'supplier_types.id');

            // Filtro de fornecedores descontinuados
            if ($request->has('discontinued')) {
                $discontinued = $request->input('discontinued') == 'true' ? true : false;
                $query->where('discontinued', $discontinued);
            }

            // Include deleted suppliers
            if ($request->has('deleted')) {
                $query->withTrashed()->whereNotNull('suppliers.deleted_at');
            } else {
                $query->whereNull('suppliers.deleted_at');
            }

            // Filtro de pesquisa
            if ($request->has('searchTerm')) {
                $searchTerm = '%' . $request->input('searchTerm') . '%';
                if ($request->input('searchField') === null) {
                    $query->where(function ($subquery) use ($searchTerm) {
                        $subquery->orWhere('suppliers.name', 'like', $searchTerm)
                            ->orWhere('suppliers.contact_name', 'like', $searchTerm)
                            ->orWhere('supplier_types.name', 'like', $searchTerm)
                            ->orWhere('users.name', 'like', $searchTerm)
                            ->orWhere('suppliers.city', 'like', $searchTerm);
                    });
                } else {
                    $searchField = $request->input('searchField');
                    if ($searchField == 'user_name') {
                        $query->where('users.name', 'like', $searchTerm);
                    } elseif ($searchField == 'supplier_type_name') {
                        $query->where('supplier_types.name', 'like', $searchTerm);
                    } else {
                        $query->where('suppliers.' . $searchField, 'like', $searchTerm);
                    }
                }
            }

            // Adicionar mais filtros
            if ($request->has('city')) {
                $query->where('suppliers.city', $request->input('city'));
            }

            if ($request->has('email')) {
                $query->where('suppliers.email', 'like', '%' . $request->input('email') . '%');
            }

            if ($request->has('phone')) {
                $query->where('suppliers.phone', 'like', '%' . $request->input('phone') . '%');
            }
               // Adicionar mais filtros
               if ($request->has('cep')) {
                $query->where('suppliers.cep', $request->input('cep'));
            }

            if ($request->has('whatsapp')) {
                $query->where('suppliers.whatsapp', 'like', '%' . $request->input('whatsapp') . '%');
            }

            if ($request->has('document_number')) {
                $query->where('suppliers.document_number', 'like', '%' . $request->input('document_number') . '%');
            }

            // Ordenação
            if ($sortField == 'user_name') {
                $query->orderBy('users.name', $sortDirection);
            } elseif ($sortField == 'supplier_type_name') {
                $query->orderBy('supplier_types.name', $sortDirection);
            } else {
                $query->orderBy('suppliers.' . $sortField, $sortDirection);
            }

            $suppliers = $query->select('suppliers.*')->paginate($itemsPerPage);

            Log::info('Consulta de Fornecedor executada com sucesso.');

            return response()->json($suppliers);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());
            return response()->json(['error' => 'Internal Server Error'], 500);
        }
    }

    public function show($supplierId)
    {
        try {
            $supplier = Supplier::with(['user', 'supplierType'])->findOrFail($supplierId);
            Log::info('Consulta de Fornecedor específico executada com sucesso.');
            return response()->json($supplier);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());
            return response()->json(['error' => 'Fornecedor não encontrado'], 404);
        }
    }

    public function updateDiscontinued(Request $request, $supplierId)
    {
        try {
            $supplier = Supplier::findOrFail($supplierId);
            $supplier->discontinued = $request->input('discontinued');
            $supplier->save();

            Log::info("Fornecedor ID {$supplierId} atualizado para discontinued: {$supplier->discontinued}");
            return response()->json(['discontinued' => $supplier->discontinued]);
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo discontinued: ' . $e->getMessage());
            return response()->json(['error' => 'Erro ao atualizar o Fornecedor'], 500);
        }
    }

    public function updateDeleted(Request $request, $supplierId)
    {
        try {
            // Busca o fornecedor, incluindo os deletados (soft deletes)
            $supplier = Supplier::withTrashed()->findOrFail($supplierId);

            // Verifica se o campo 'deleted' está presente na requisição
            if ($request->has('deleted')) {
                $updatedDeleted = (bool) $request->input('deleted');

                // Se 'deleted' for true, deleta o fornecedor (soft delete)
                if ($updatedDeleted) {
                    $supplier->delete();
                } else {
                    // Se 'deleted' for false, restaura o fornecedor
                    $supplier->restore();
                }

                // Log da operação realizada
                Log::info("Fornecedor ID {$supplierId} atualizado para deleted: {$updatedDeleted}");

                // Retorna uma resposta JSON com o estado atualizado
                return response()->json(['deleted' => $updatedDeleted]);
            } else {
                // Caso o campo 'deleted' não esteja presente na requisição
                return response()->json(['error' => 'Campo \'deleted\' não fornecido na requisição'], 400);
            }
        } catch (\Exception $e) {
            // Captura e registra qualquer exceção ocorrida durante o processo
            Log::error('Erro ao atualizar o campo deleted: ' . $e->getMessage());

            // Retorna uma resposta de erro padrão em caso de falha
            return response()->json(['error' => 'Erro ao atualizar o Fornecedor'], 500);
        }
    }

}


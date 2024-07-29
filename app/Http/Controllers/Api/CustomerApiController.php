<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Customer;
use Illuminate\Support\Facades\Log;

class CustomerApiController extends Controller
{
    public function index(Request $request)
    {
        try {
            $sortField = $request->input('sortField', 'name');
            $sortDirection = $request->input('sortDirection', 'asc');
            $itemsPerPage = $request->input('itemsPerPage', 10);

            $query = Customer::query()
                ->with(['user', 'customerType'])
                ->leftJoin('users', 'customers.user_id', '=', 'users.id')
                ->leftJoin('customer_types', 'customers.customer_type_id', '=', 'customer_types.id');

            // Filtro de Clientes descontinuados
            if ($request->has('discontinued')) {
                $discontinued = $request->input('discontinued') == 'true' ? true : false;
                $query->where('discontinued', $discontinued);
            }

            // Include deleted customers
            if ($request->has('deleted')) {
                $query->withTrashed()->whereNotNull('customers.deleted_at');
            } else {
                $query->whereNull('customers.deleted_at');
            }

            // Filtro de pesquisa
            if ($request->has('searchTerm')) {
                $searchTerm = '%' . $request->input('searchTerm') . '%';
                if ($request->input('searchField') === null) {
                    $query->where(function ($subquery) use ($searchTerm) {
                        $subquery->orWhere('customers.name', 'like', $searchTerm)
                            ->orWhere('customers.contact_name', 'like', $searchTerm)
                            ->orWhere('customer_types.name', 'like', $searchTerm)
                            ->orWhere('users.name', 'like', $searchTerm)
                            ->orWhere('customers.city', 'like', $searchTerm);
                    });
                } else {
                    $searchField = $request->input('searchField');
                    if ($searchField == 'user_name') {
                        $query->where('users.name', 'like', $searchTerm);
                    } elseif ($searchField == 'customer_type_name') {
                        $query->where('customer_types.name', 'like', $searchTerm);
                    } else {
                        $query->where('customers.' . $searchField, 'like', $searchTerm);
                    }
                }
            }

            // Adicionar mais filtros
            if ($request->has('city')) {
                $query->where('customers.city', $request->input('city'));
            }

            if ($request->has('email')) {
                $query->where('customers.email', 'like', '%' . $request->input('email') . '%');
            }

            if ($request->has('phone')) {
                $query->where('customers.phone', 'like', '%' . $request->input('phone') . '%');
            }
               // Adicionar mais filtros
               if ($request->has('cep')) {
                $query->where('customers.cep', $request->input('cep'));
            }

            if ($request->has('whatsapp')) {
                $query->where('customers.whatsapp', 'like', '%' . $request->input('whatsapp') . '%');
            }

            if ($request->has('document_number')) {
                $query->where('customers.document_number', 'like', '%' . $request->input('document_number') . '%');
            }

            // Ordenação
            if ($sortField == 'user_name') {
                $query->orderBy('users.name', $sortDirection);
            } elseif ($sortField == 'customer_type_name') {
                $query->orderBy('customer_types.name', $sortDirection);
            } else {
                $query->orderBy('customers.' . $sortField, $sortDirection);
            }

            $customers = $query->select('customers.*')->paginate($itemsPerPage);

            Log::info('Consulta de Cliente executada com sucesso.');

            return response()->json($customers);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());
            return response()->json(['error' => 'Internal Server Error'], 500);
        }
    }

    public function show($customerId)
    {
        try {
            $customer = Customer::with(['user', 'customerType'])->findOrFail($customerId);
            Log::info('Consulta de Cliente específico executada com sucesso.');
            return response()->json($customer);
        } catch (\Exception $e) {
            Log::error('Erro no processamento da solicitação: ' . $e->getMessage());
            return response()->json(['error' => 'Cliente não encontrado'], 404);
        }
    }

    public function updateDiscontinued(Request $request, $customerId)
    {
        try {
            $customer = Customer::findOrFail($customerId);
            $customer->discontinued = $request->input('discontinued');
            $customer->save();

            Log::info("Cliente ID {$customerId} atualizado para discontinued: {$customer->discontinued}");
            return response()->json(['discontinued' => $customer->discontinued]);
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo discontinued: ' . $e->getMessage());
            return response()->json(['error' => 'Erro ao atualizar o Cliente'], 500);
        }
    }

    public function updateDeleted(Request $request, $customerId)
    {
        try {
            // Busca o Cliente, incluindo os deletados (soft deletes)
            $customer = Customer::withTrashed()->findOrFail($customerId);

            // Verifica se o campo 'deleted' está presente na requisição
            if ($request->has('deleted')) {
                $updatedDeleted = (bool) $request->input('deleted');

                // Se 'deleted' for true, deleta o Cliente (soft delete)
                if ($updatedDeleted) {
                    $customer->delete();
                } else {
                    // Se 'deleted' for false, restaura o Cliente
                    $customer->restore();
                }

                // Log da operação realizada
                Log::info("Cliente ID {$customerId} atualizado para deleted: {$updatedDeleted}");

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
            return response()->json(['error' => 'Erro ao atualizar o Cliente'], 500);
        }
    }

}


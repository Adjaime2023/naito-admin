<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Employee;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

class EmployeeApiController extends Controller
{
    public function index(Request $request)
    {
        $query = Employee::query();

            // Filtro de Clientes descontinuados
            if ($request->has('discontinued')) {
                $discontinued = $request->input('discontinued') == 'true' ? true : false;
                $query->where('discontinued', $discontinued);
            }

            // Include deleted employees
            if ($request->has('deleted')) {
                $query->withTrashed()->whereNotNull('employees.deleted_at');
            } else {
                $query->whereNull('employees.deleted_at');
            }

        if ($request->has('searchField') && $request->has('searchTerm')) {
            $field = $request->searchField;
            $term = $request->searchTerm;
            $query->where($field, 'like', "%$term%");
        }

        $employees = $query->orderBy($request->sortField ?? 'name', $request->sortDirection ?? 'asc')
            ->paginate($request->per_page ?? 10);

        return response()->json($employees);
    }

    public function show($employeeId)
    {
        try {
            $employee = Employee::with(['user', 'office'])->findOrFail($employeeId);
            Log::info('Successfully retrieved specific employee.');
            return response()->json($employee);
        } catch (\Exception $e) {
            Log::error('Error processing request: ' . $e->getMessage());
            return response()->json(['error' => 'Employee not found'], 404);
        }
    }

    public function updateDiscontinued(Request $request, $employeeId)
    {
        try {
            $employee = Employee::findOrFail($employeeId);

            if ($request->has('discontinued')) {
                $employee->discontinued = $request->input('discontinued');
                $employee->save();

                Log::info("Funcionário ID {$employeeId} atualizado para discontinued: {$employee->discontinued}");
                return response()->json(['discontinued' => $employee->discontinued]);
            } else {
                return response()->json(['error' => 'Campo \'discontinued\' não fornecido na requisição'], 400);
            }
        } catch (\Exception $e) {
            Log::error('Erro ao atualizar o campo discontinued: ' . $e->getMessage());
            return response()->json(['error' => 'Erro ao atualizar o Funcionário'], 500);
        }
    }

    public function updateDeleted(Request $request, $employeeId)
    {
        try {
            // Busca o Funcionário, incluindo os deletados (soft deletes)
            $employee = Employee::withTrashed()->findOrFail($employeeId);

            // Verifica se o campo 'deleted' está presente na requisição
            if ($request->has('deleted')) {
                $updatedDeleted = (bool) $request->input('deleted');

                // Se 'deleted' for true, deleta o Funcionário (soft delete)
                if ($updatedDeleted) {
                    $employee->delete();
                } else {
                    // Se 'deleted' for false, restaura o Funcionário
                    $employee->restore();
                }

                // Log da operação realizada
                Log::info("Funcionário ID {$employeeId} atualizado para deleted: {$updatedDeleted}");

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
            return response()->json(['error' => 'Erro ao atualizar o Funcionário'], 500);
        }
    }
}

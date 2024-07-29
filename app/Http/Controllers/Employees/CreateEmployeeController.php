<?php

namespace App\Http\Controllers\Employees;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Employee;
use App\Models\Office;
use App\Models\User;
use Inertia\Inertia;
use Illuminate\Support\Facades\Log;

class CreateEmployeeController extends Controller
{
        // Caminho padrão para a imagem
    const DEFAULT_IMAGE_PATH = '/storage/images/default.png';

    public function create()
    {
        $offices = Office::all();
        $users = User::all();

        return Inertia::render('Ecommerce/Admin/Employees/Create', [
            'offices' => $offices,
            'users' => $users,
            'defaultImagePath' => self::DEFAULT_IMAGE_PATH,
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'cpf' => 'required|string|unique:employees,cpf',
            'identification_number' => 'nullable|string',
            'contact_name' => 'nullable|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'office_id' => 'required|exists:offices,id',
            'email' => 'nullable|string',
            'whatsapp' => 'nullable|string',
            'phone' => 'nullable|string',
            'cep' => 'nullable|string',
            'city' => 'nullable|string',
            'uf' => 'nullable|string',
            'address' => 'nullable|string',
            'number' => 'nullable|string',
            'complement' => 'nullable|string',
            'neighborhood' => 'nullable|string',
            'action_user' => 'nullable|string',
        ]);

        try {
            // Define a imagem padrão
            $defaultImage = self::DEFAULT_IMAGE_PATH;

            $employee = Employee::create([
                'name' => $validated['name'],
                'cpf' => $validated['cpf'],
                'identification_number' => $validated['identification_number'],
                'contact_name' => $validated['contact_name'],
                'image' => $defaultImage,
                'office_id' => $validated['office_id'],
                'email' => $validated['email'],
                'whatsapp' => $validated['whatsapp'],
                'phone' => $validated['phone'],
                'cep' => $validated['cep'],
                'city' => $validated['city'],
                'uf' => $validated['uf'],
                'address' => $validated['address'],
                'number' => $validated['number'],
                'complement' => $validated['complement'],
                'neighborhood' => $validated['neighborhood'],
                'action_user' => $validated['action_user'],
            ]);


            Log::debug('Funcionário criado:', $employee->toArray()); // Converter para array

            if ($request->hasFile('image')) {
                Log::debug('Upload de imagem detectado.');
                $image = $request->file('image');
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $employee->name));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . date('YmdHi') . '.' . $extension;
                $path = $image->storeAs('employees/' . $employee->id, $filename, 'public');
                $employee->image = $path;
                $employee->save();
            }

            return redirect()->route('employee.edit', $employee->id)
                ->with('flash.banner', 'Funcionário criado com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            Log::error('Erro ao salvar Funcionário: ' . $e->getMessage());
            return redirect()->back()
                ->with('danger', 'Erro ao criar o Funcionário: ' . $e->getMessage());
        }
    }
}

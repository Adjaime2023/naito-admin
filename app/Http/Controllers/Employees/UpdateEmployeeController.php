<?php

namespace App\Http\Controllers\Employees;

use App\Http\Controllers\Controller;
use App\Models\Employee;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Models\User;
use Inertia\Inertia;
use App\Models\Office;

class UpdateEmployeeController extends Controller
{
    public function edit($id)
    {
        $employee = Employee::findOrFail($id);
        $offices = Office::all();
        $users = User::all();

        return Inertia::render('Ecommerce/Admin/Employees/Update', [
            'employee' => $employee,
            'offices' => $offices,
            'users' => $users,
        ]);
    }

    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'office_id' => 'required|exists:offices,id',
            'user_id' => 'nullable|exists:users,id',
            'cpf' => 'required|string|unique:employees,cpf,' . $id,
            'identification_number' => 'required|string',
            'contact_name' => 'required|string',
            'email' => 'nullable|string',
            'whatsapp' => 'nullable|string',
            'phone' => 'nullable|string',
            'cep' => 'nullable|string',
            'city' => 'nullable|string',
            'uf' => 'required|string|max:2',
            'address' => 'nullable|string',
            'number' => 'nullable|string',
            'complement' => 'nullable|string',
            'neighborhood' => 'nullable|string',
            'action_user' => 'nullable|string',
        ]);

        try {
            $employee = Employee::findOrFail($id);
            $employee->update($validatedData);

            return Redirect::route('employee.edit', $employee->id)
                ->with('flash.banner', 'Funcionário atualizado com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar o Funcionário: ' . $e->getMessage());
        }
    }


    public function updateImage(Request $request, $id)
    {
        $validated = $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        try {
            $employee = Employee::findOrFail($id);

            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $employee->name));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . date('YmdHi') . '.' . $extension;
                $path = $image->storeAs('employees/' . $employee->id, $filename, 'public');

                if ($employee->image && $employee->image !== 'images/default.png') {
                    Storage::disk('public')->delete($employee->image);
                }

                $employee->image = $path;
                $employee->save();
            }

            return Redirect::route('employee.edit', $employee->id)
                ->with('flash.banner', 'Imagem da Funcionário atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da Funcionário: ' . $e->getMessage());
        }
    }
}

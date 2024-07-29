<?php

namespace App\Http\Controllers\Customers;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Models\User;
use Inertia\Inertia;
use App\Models\CustomerType;

class UpdateCustomerController extends Controller
{
    public function edit($id)
    {
        $customer = Customer::findOrFail($id);
        $customerTypes = CustomerType::all();
        $users = User::all();

        return Inertia::render('Ecommerce/Admin/Customers/Update', [
            'customer' => $customer,
            'customerTypes' => $customerTypes,
            'users' => $users,
        ]);
    }

    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'customer_type_id' => 'required|exists:customer_types,id',
            'user_id' => 'nullable|exists:users,id',
            'person_type' => 'required|string',
            'document_number' => 'required|string',
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
            $customer = Customer::findOrFail($id);
            $customer->update($validatedData);

            return Redirect::route('customer.edit', $customer->id)
                ->with('flash.banner', 'Cliente atualizado com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar o Cliente: ' . $e->getMessage());
        }
    }


    public function updateImage(Request $request, $id)
    {
        $validated = $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        try {
            $customer = Customer::findOrFail($id);

            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $customer->name));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . date('YmdHi') . '.' . $extension;
                $path = $image->storeAs('customers/' . $customer->id, $filename, 'public');

                if ($customer->image && $customer->image !== 'images/default.png') {
                    Storage::disk('public')->delete($customer->image);
                }

                $customer->image = $path;
                $customer->save();
            }

            return Redirect::route('customer.edit', $customer->id)
                ->with('flash.banner', 'Imagem da Cliente atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da Cliente: ' . $e->getMessage());
        }
    }
}

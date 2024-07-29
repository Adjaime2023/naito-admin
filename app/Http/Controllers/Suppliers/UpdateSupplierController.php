<?php

namespace App\Http\Controllers\Suppliers;

use App\Http\Controllers\Controller;
use App\Models\Supplier;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Models\User;
use Inertia\Inertia;
use App\Models\SupplierType;

class UpdateSupplierController extends Controller
{
    public function edit($id)
    {
        $supplier = Supplier::findOrFail($id);
        $supplierTypes = SupplierType::all();
        $users = User::all();

        return Inertia::render('Ecommerce/Admin/Suppliers/Update', [
            'supplier' => $supplier,
            'supplierTypes' => $supplierTypes,
            'users' => $users,
        ]);
    }

    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'supplier_type_id' => 'required|exists:supplier_types,id',
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
            $supplier = Supplier::findOrFail($id);
            $supplier->update($validatedData);

            return Redirect::route('supplier.edit', $supplier->id)
                ->with('flash.banner', 'Fornecedor atualizado com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar o fornecedor: ' . $e->getMessage());
        }
    }


    public function updateImage(Request $request, $id)
    {
        $validated = $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        try {
            $supplier = Supplier::findOrFail($id);

            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $supplier->name));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . date('YmdHi') . '.' . $extension;
                $path = $image->storeAs('suppliers/' . $supplier->id, $filename, 'public');

                if ($supplier->image && $supplier->image !== 'images/default.png') {
                    Storage::disk('public')->delete($supplier->image);
                }

                $supplier->image = $path;
                $supplier->save();
            }

            return Redirect::route('supplier.edit', $supplier->id)
                ->with('flash.banner', 'Imagem da Fornecedor atualizada com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            return redirect()->back()
                ->with('danger', 'Erro ao atualizar a Imagem da Fornecedor: ' . $e->getMessage());
        }
    }
}

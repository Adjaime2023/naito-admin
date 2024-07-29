<?php

namespace App\Http\Controllers\Suppliers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Supplier;
use App\Models\SupplierType;
use App\Models\User;
use Inertia\Inertia;
use Illuminate\Support\Facades\Log;

class CreateSupplierController extends Controller
{
    // Caminho padrão para a imagem
    const DEFAULT_IMAGE_PATH = '/storage/images/default.png';

    public function create()
    {
        $supplierTypes = SupplierType::all();
        $users = User::all();

        return Inertia::render('Ecommerce/Admin/Suppliers/Create', [
            'supplierTypes' => $supplierTypes,
            'users' => $users,
            'defaultImagePath' => self::DEFAULT_IMAGE_PATH,
        ]);
    }
    

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'person_type' => 'required|string',
            'document_number' => 'nullable|string',
            'identification_number' => 'nullable|string',
            'contact_name' => 'nullable|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'supplier_type_id' => 'required|exists:supplier_types,id',
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

            $supplier = Supplier::create([
                'name' => $validated['name'],
                'person_type' => $validated['person_type'],
                'document_number' => $validated['document_number'],
                'identification_number' => $validated['identification_number'],
                'contact_name' => $validated['contact_name'],
                'image' => $defaultImage,
                'supplier_type_id' => $validated['supplier_type_id'],
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


            Log::debug('Fornecedor criado:', $supplier->toArray()); // Converter para array

            if ($request->hasFile('image')) {
                Log::debug('Upload de imagem detectado.');
                $image = $request->file('image');
                $sanitizedName = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '_', $supplier->name));
                $extension = $image->getClientOriginalExtension();
                $filename = $sanitizedName . '_' . date('YmdHi') . '.' . $extension;
                $path = $image->storeAs('suppliers/' . $supplier->id, $filename, 'public');
                $supplier->image = $path;
                $supplier->save();
            }

            return redirect()->route('supplier.edit', $supplier->id)
                ->with('flash.banner', 'Fornecedor criado com sucesso!')
                ->with('flash.bannerStyle', 'success');
        } catch (\Exception $e) {
            Log::error('Erro ao salvar fornecedor: ' . $e->getMessage());
            return redirect()->back()
                ->with('danger', 'Erro ao criar o Fornecedor: ' . $e->getMessage());
        }
    }
}

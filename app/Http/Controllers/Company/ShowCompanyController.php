<?php

namespace App\Http\Controllers\Company;

use App\Http\Controllers\Controller;
use App\Models\Company;
use Inertia\Inertia;

class ShowCompanyController extends Controller
{
    public function show()
    {
        // ID fixo como 1 para este exemplo
        $company = Company::findOrFail(1);

        return Inertia::render('Ecommerce/Admin/Company/Show', [
            'company' => $company,
        ]);
    }
}

<?php

namespace App\Http\Controllers\Suppliers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ShowSupplierController extends Controller
{
    public function show()
    {
    return Inertia::render('Ecommerce/Admin/Suppliers/Show');
    }
}

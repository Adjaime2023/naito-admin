<?php

namespace App\Http\Controllers\Customers;

use App\Http\Controllers\Controller;
use Inertia\Inertia;

class ShowCustomerController extends Controller
{
    public function show()
    {
    return Inertia::render('Ecommerce/Admin/Customers/Show');
    }
}

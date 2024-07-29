<?php

namespace App\Http\Controllers\Employees;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ShowEmployeeController extends Controller
{
    public function show()
    {
    return Inertia::render('Ecommerce/Admin/Employees/Show'); 
    }
}

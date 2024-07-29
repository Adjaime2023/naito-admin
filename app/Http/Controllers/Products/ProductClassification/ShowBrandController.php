<?php

namespace App\Http\Controllers\Products\ProductClassification;

use App\Http\Controllers\Controller;
use Inertia\Inertia;

class ShowBrandController extends Controller
{
    public function show()
    {
        return Inertia::render('Ecommerce/Admin/ProductClassification/Brands/Show');
    }
}

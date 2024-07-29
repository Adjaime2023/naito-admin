<?php

namespace App\Http\Controllers\Products\ProductClassification;

use App\Http\Controllers\Controller;
use Inertia\Inertia;

class ShowSizeController extends Controller
{
    public function show()
    {
        return Inertia::render('Ecommerce/Admin/ProductClassification/Sizes/Show');
    }
}


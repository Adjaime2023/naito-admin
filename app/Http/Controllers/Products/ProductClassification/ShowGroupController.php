<?php

namespace App\Http\Controllers\Products\ProductClassification;

use App\Http\Controllers\Controller;
use Inertia\Inertia;

class ShowGroupController extends Controller
{
    public function show()
    {
        return Inertia::render('Ecommerce/Admin/ProductClassification/Groups/Show');
    }
}

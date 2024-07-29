<?php

namespace App\Http\Controllers\Products;

use App\Http\Controllers\Controller;
use Inertia\Inertia;

class ListProductController extends Controller
{
    public function show()
    {
    return Inertia::render('Ecommerce/Admin/Products/Show');
    }
}

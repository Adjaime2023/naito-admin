<?php

namespace App\Http\Controllers\Partners;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ShowPartnerController extends Controller
{
    public function show()
    {
    return Inertia::render('Ecommerce/Admin/Partners/Show');
    }

}

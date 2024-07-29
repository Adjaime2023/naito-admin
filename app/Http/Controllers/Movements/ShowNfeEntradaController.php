<?php

namespace App\Http\Controllers\Movements;

use App\Http\Controllers\Controller;
use App\Models\Movements\NfeEntrada;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ShowNfeEntradaController extends Controller
{
   
    public function show()
    {
    return Inertia::render('Ecommerce/Movements/Entries/Show');
    }
    
  
}

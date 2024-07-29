<?php
namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use App\Models\Products\Product;
use Inertia\Inertia;

class ProductLaunchController extends Controller
{
    public function index()
    {


        return Inertia::render('Ecommerce/WebsiteManagement/Products/Show');
    }


}

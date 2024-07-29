<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ShowBannerController extends Controller
{
    public function show()
    {
    return Inertia::render('Ecommerce/WebsiteManagement/Banners/Show');
    }
}

<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use Inertia\Inertia;


class ShowSitePartnerController extends Controller
{
    public function showPartner()
    {
    return Inertia::render('Ecommerce/WebsiteManagement/Partners/Show');
    }
}

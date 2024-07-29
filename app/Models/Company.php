<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Company extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'name',
        'contact',
        'support_message',
        'description',
        'slogan',
        'portifolio',
        'mission',
        'vision',
        'values',
        'image_about',
        'image_about_right',
        'experience1',
        'experience2',
        'experience3',
        'email',
        'website',
        'phone',
        'whatsapp',
        'facebook',
        'x',
        'tictok',
        'instagram',
        'cep',
        'city',
        'uf',
        'address',
        'number',
        'complement',
        'neighborhood',
        'latitude',
        'longitude',
        'nivel_zoon',
        'favicon',
        'logo_light',
        'logo_dark',
        'image_footer',
        'description1',
        'link1' ,
        'image_footer_botton',
        'description2',
        'link2',
        'discontinued',
    ];
}

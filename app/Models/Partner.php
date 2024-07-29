<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Partner extends Model
{
    use HasFactory, SoftDeletes;


    protected $fillable = [
        'name',
        'contact',
        'email',
        'website',
        'phone',
        'whatsapp',
        'instagram',
        'facebook',
        'x',
        'tictok',
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
        'discontinued',
    ];
}

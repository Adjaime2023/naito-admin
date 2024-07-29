<?php

namespace App\Models\Products;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Color extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'hex_code',
        'image',
        'discontinued',
        'deleted',
        'action_user',
    ];
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SlideBanner extends Model
{
    use HasFactory, SoftDeletes;


    protected $fillable = [
       'image_url_mobile',
       'image_url_tablet',
       'image_url_laptop',
       'image_url_desktop',
       'alt',
       'title',
       'description',
       'description2',
       'logo_white',
       'logo_black',
       'url',
       'horizontal_alignment',
       'vertical_alignment',
       'discontinued',
       'deleted',

    ];
}

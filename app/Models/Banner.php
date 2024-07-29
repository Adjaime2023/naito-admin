<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;

class Banner extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'title',
        'alt',
        'description',
        'description2',
        'image_url_mobile',
        'image_url_tablet',
        'image_url_laptop',
        'image_url_desktop',
        'logo_light',
        'logo_dark',
        'url',
        'horizontal_alignment',
        'vertical_alignment',
        'date',
        'slide',
        'banner',
        'discontinued',
    ];

    protected $dates = [
        'date',
        'deleted_at', // Para usar soft deletes
    ];

    // Mutador para formatar a data como desejado
    public function setDateAttribute($value)
    {
        $this->attributes['date'] = date('Y-m-d H:i:s', strtotime($value));
    }

}

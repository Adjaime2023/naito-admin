<?php

namespace App\Models\Products;


use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;

class Size extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'product_id',
        'name',
        'stock',
        'description',
        'size',
        'image',
        'action_user',
        'discontinued',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}

<?php

namespace App\Models\Products;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductFee extends Model
{

    use HasFactory;

    protected $fillable = [
        'product_id',
        'taxes_gov',
        'tax_gateway',
        'tax_platform',
        'tax_marketplace',
        'tax_intermediation',
        'tax_commission',
        'tax_additional_services'
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}

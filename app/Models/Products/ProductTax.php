<?php

namespace App\Models\Products;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductTax extends Model
{
    
    use HasFactory;

    protected $fillable = [
        'product_id', 'icms', 'ipi', 'pis_pasep', 'cofins', 'irpj', 'csll'
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

}

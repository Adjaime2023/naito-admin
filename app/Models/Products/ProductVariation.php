<?php

namespace App\Models\Products;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductVariation extends Model
{
    use HasFactory;

    protected $fillable = [
        'product_id', 'size_id', 'color_id', 'price', 'stock', 'sku'
    ];

    // Relação com o produto
    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    // Relação com o tamanho
    public function size()
    {
        return $this->belongsTo(Size::class);
    }

    // Relação com a cor
    public function color()
    {
        return $this->belongsTo(Color::class);
    }
}

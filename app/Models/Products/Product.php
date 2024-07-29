<?php

namespace App\Models\Products;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;
Use App\Models\Movements\NfeItem;


class Product extends Model
{
    use HasFactory, SoftDeletes;


    protected $fillable = [
        'name',
        'description',
        'sku',
        'qr_code',
        'barcode',
        'purchase_price',
        'shipping_value',
        'cost_price',
        'profit_margin',
        'freight_sale',
        'sale_price',
        'stock',
        'image',
        'image_hover',
        'launch',
        'promotion',
        'promotion_price',
        'category_id',
        'subcategory_id',
        'group_id',
        'subgroup_id',
        'collection_id',
        'brand_id',
        'color_id',
        'action_user',
        'discontinued',
    ];



    public function images()
    {
        return $this->hasMany(ProductImage::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function subcategory()
    {
        return $this->belongsTo(Subcategory::class);
    }

    public function group()
    {
        return $this->belongsTo(Group::class);
    }

    public function subgroup()
    {
        return $this->belongsTo(Subgroup::class);
    }

    public function collection()
    {
        return $this->belongsTo(Collection::class);
    }

    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }

    public function color()
    {
        return $this->belongsTo(Color::class);
    }

    public function sizes()
    {
        return $this->hasMany(Size::class);
    }

    public function nfeItems()
    {
        return $this->hasMany(NfeItem::class);
    }
}

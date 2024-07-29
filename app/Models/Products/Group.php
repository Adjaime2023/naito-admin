<?php

namespace App\Models\Products;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class Group extends Model
{
    use HasFactory, SoftDeletes;


    protected $fillable = [
        'subcategory_id',
        'name',
        'description',
        'image',
        'discontinued',
        'action_user',
    ];

    public function subcategory()
    {
        return $this->belongsTo(Subcategory::class);
    }
    public function products()  // Corrigir para plural
    {
        return $this->hasMany(Product::class);
    }

    public function subgroups()
    {
        return $this->hasMany(Subgroup::class);
    }
}

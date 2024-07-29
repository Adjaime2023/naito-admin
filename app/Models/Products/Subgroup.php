<?php

namespace App\Models\Products;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subgroup extends Model
{
    use HasFactory;


    protected $fillable = [
        'group_id', // Adicione este campo
        'name',
        'description',
        'image',
        'discontinued',
        'deleted',
        'action_user',
    ];

    public function group()
    {
        return $this->belongsTo(Group::class);
    }
}

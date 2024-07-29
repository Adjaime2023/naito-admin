<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Office extends Model
{
    use HasFactory;

    protected $fillable = [
        'sector_id',
        'name',
        'description',
        'action_user',
        'discontinued'
    ];

    public function sector()
    {
        return $this->belongsTo(Sector::class);
    }
}

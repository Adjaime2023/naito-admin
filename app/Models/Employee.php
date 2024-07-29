<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Employee extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'name',
        'user_id',
        'office_id', // Atualizado para office_id
        'cpf',
        'identification_number',
        'contact_name',
        'email',
        'whatsapp',
        'phone',
        'cep',
        'city',
        'uf',
        'address',
        'number',
        'complement',
        'neighborhood',
        'action_user',
        'discontinued',
        'role',
    ];



    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function office()
    {
        return $this->belongsTo(Office::class);
    }
}

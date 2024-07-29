<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Customer extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'user_id',
        'name',
        'person_type',
        'document_number',
        'identification_number',
        'image',
        'contactName',
        'customer_type_id',
        'Email',
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
        'discontinued'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function customerType()
    {
        return $this->belongsTo(CustomerType::class);
    }
}

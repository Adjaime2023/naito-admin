<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Supplier extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'user_id',
        'name',
        'person_type',
        'document_number',
        'identification_number',
        'contact_name',
        'image',
        'supplier_type_id',
        'email',
        'whatsapp',
        'phone',
        'cep',
        'uf',
        'city',
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

    public function supplierType()
    {
        return $this->belongsTo(SupplierType::class);
    }
}

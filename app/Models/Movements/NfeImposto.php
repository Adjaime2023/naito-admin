<?php

namespace App\Models\Movements;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class NfeImposto extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'nfe_item_id',
        'tipo_imposto',
        'valor_base_calculo',
        'valor_imposto',
        'aliquota',
        'action_user',
        'discontinued'
    ];

    public function nfeItem()
    {
        return $this->belongsTo(NfeItem::class, 'nfe_item_id');
    }
}

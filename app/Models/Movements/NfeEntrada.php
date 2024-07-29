<?php

namespace App\Models\Movements;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class NfeEntrada extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'chave_acesso',
        'numero',
        'serie',
        'data_emissao',
        'data_recebimento',
        'nome_emitente',
        'cnpj_emitente',
        'nome_destinatario',
        'cnpj_destinatario',
        'valor_total',
        'valor_icms',
        'action_user',
        'discontinued'
    ];

    // Define a relação com NfeItem
    public function nfeItems()
    {
        return $this->hasMany(NfeItem::class, 'nfe_entrada_id');
    }
}

<?php

namespace App\Models\Movements;

use App\Models\Products\Product;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class NfeItem extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'nfe_entrada_id',
        'product_id',
        'codigo_produto',
        'descricao',
        'ncm',
        'cst',
        'cfop',
        'unidade',
        'quantidade',
        'valor_unitario',
        'valor_total',
        'action_user',
        'discontinued'
    ];

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }

    public function nfeEntrada()
    {
        return $this->belongsTo(NfeEntrada::class, 'nfe_entrada_id');
    }



    public function impostos()
    {
        return $this->hasMany(NfeImposto::class, 'nfe_item_id');
    }
}

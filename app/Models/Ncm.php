<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ncm extends Model
{
    use HasFactory;

    protected $fillable = [
        'codigo',
        'descricao',
        'data_inicio', // Corrigido para 'data_inicio'
        'data_fim',    // Corrigido para 'data_fim'
        'tipo_ato_ini', // Corrigido para 'tipo_ato_ini'
        'numero_ato_ini', // Corrigido para 'numero_ato_ini'
        'ano_ato_ini', // Corrigido para 'ano_ato_ini'
    ];
}

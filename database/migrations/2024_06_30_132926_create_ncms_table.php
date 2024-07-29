<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('ncms', function (Blueprint $table) {
            $table->id();
            $table->string('codigo');
            $table->string('descricao');
            $table->date('data_inicio');  // Corrigido para 'date'
            $table->date('data_fim');  // Corrigido para 'date'
            $table->string('tipo_ato_ini');  // Corrigido para 'string'
            $table->string('numero_ato_ini');  // Corrigido para 'string'
            $table->integer('ano_ato_ini');  // Corrigido para 'integer'
            $table->text('action_user')->nullable();
            $table->boolean('discontinued')->default(false);
            $table->softDeletes(); // Adiciona a coluna deleted_at
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ncms');
    }
};

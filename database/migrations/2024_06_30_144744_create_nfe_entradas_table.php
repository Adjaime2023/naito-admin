<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNfeEntradasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up(): void
    {
        Schema::create('nfe_entradas', function (Blueprint $table) {
            $table->id();
            $table->string('chave_acesso');
            $table->string('numero');
            $table->string('serie');
            $table->date('data_emissao');
            $table->date('data_recebimento');
            $table->string('nome_emitente');
            $table->string('cnpj_emitente');
            $table->string('nome_destinatario');
            $table->string('cnpj_destinatario');
            $table->decimal('valor_total', 10, 2);
            $table->decimal('valor_icms', 10, 2);
            $table->text('action_user')->nullable();
            $table->boolean('discontinued')->default(false);
            $table->softDeletes(); // Adiciona a coluna deleted_at
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down(): void
    {
        Schema::dropIfExists('nfe_entradas');
    }
}

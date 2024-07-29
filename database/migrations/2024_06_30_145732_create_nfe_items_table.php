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
        Schema::create('nfe_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('nfe_entrada_id')->constrained()->onDelete('cascade');          
            $table->foreignId('product_id')->constrained('products')->onDelete('cascade')->nullable();
            $table->string('codigo_produto');
            $table->string('descricao');
            $table->string('ncm');
            $table->string('cst');
            $table->string('cfop');
            $table->string('unidade');
            $table->decimal('quantidade', 10, 4);
            $table->decimal('valor_unitario', 10, 2);
            $table->decimal('valor_total', 10, 2);
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
        Schema::dropIfExists('nfe_items');
    }
};

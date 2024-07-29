<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSizesTable extends Migration
{
    public function up()
    {
        Schema::create('sizes', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product_id'); // Relacionamento com produtos
            $table->string('name');
            $table->integer('stock')->default(0);
            $table->string('description')->nullable();       
            $table->text('size')->nullable(); // Descrição opcional
            $table->string('image')->nullable();
            $table->text('action_user')->nullable();
            $table->boolean('discontinued')->default(false);
            $table->softDeletes(); // Adiciona a coluna deleted_at
            $table->timestamps();

            // Chave estrangeira para a tabela de produtos
            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
            
            // Adicionar a restrição de unicidade composta
            $table->unique(['product_id', 'name']);
        });
    }

    public function down()
    {
        Schema::dropIfExists('sizes');
    }
}


<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSuppliersTable extends Migration
{
    public function up()
    {
        Schema::create('suppliers', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->unsignedBigInteger('user_id')->nullable();
            $table->enum('person_type', ['Fisica', 'Juridica'])->default('Fisica');
            $table->foreignId('supplier_type_id')->constrained()->onDelete('cascade')->nullable();
            $table->string('document_number')->unique();
            $table->string('identification_number')->unique();
            $table->string('contact_name');
            $table->string('email');
            $table->string('whatsapp');
            $table->string('phone');
            $table->string('cep');
            $table->string('city');
            $table->string('uf');
            $table->string('address');
            $table->string('number');
            $table->string('image')->nullable();
            $table->string('complement')->nullable();
            $table->string('neighborhood');
            $table->text('action_user')->nullable();
            $table->enum('role', ['admin', 'employee', 'customer', 'supplier', 'finance', 'sale'])->default('supplier');
            $table->boolean('discontinued')->default(false);
            $table->softDeletes(); // Adiciona a coluna deleted_at
            $table->timestamps();

            // Define a chave estrangeira para user_id
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('suppliers');
    }
}

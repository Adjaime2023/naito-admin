<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->id();
            $table->string('name'); // Adiciona a coluna name
            $table->unsignedBigInteger('user_id')->nullable();
            $table->enum('person_type', ['Fisica', 'Juridica'])->default('Fisica');
            $table->foreignId('customer_type_id')->constrained()->onDelete('cascade')->nullable();
            $table->string('document_number')->unique();
            $table->string('identification_number')->unique();
            $table->string('contact_name'); // Ajustando o nome do campo para manter o padrão de snake_case
            $table->string('email'); // Ajustando o nome do campo para manter o padrão de snake_case
            $table->string('whatsapp'); // Ajustando o nome do campo para manter o padrão de snake_case
            $table->string('phone'); // Ajustando o nome do campo para manter o padrão de snake_case
            $table->string('image')->nullable();
            $table->string('cep');
            $table->string('city');
            $table->string('uf');
            $table->string('address');
            $table->string('number');
            $table->string('complement')->nullable();
            $table->string('neighborhood');
            $table->text('action_user')->nullable();
            $table->boolean('discontinued')->default(false);
            $table->enum('role', ['admin', 'employee', 'customer', 'supplier', 'finance', 'sale'])->default('customer');
            $table->softDeletes(); // Adiciona a coluna deleted_at
            $table->timestamps();

            // Definindo a chave estrangeira
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('customers');
    }
};

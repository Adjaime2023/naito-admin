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
        Schema::create('partners', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('contact');
            $table->string('email')->unique();
            $table->string('website')->nullable();
            $table->string('phone')->nullable();
            $table->string('whatsapp')->nullable();
            $table->string('facebook')->nullable();
            $table->string('x')->nullable();
            $table->string('tiktok')->nullable();            
            $table->string('instagram')->nullable();
            $table->string('cep');
            $table->string('city');
            $table->string('uf');
            $table->string('number');
            $table->string('complement')->nullable();
            $table->string('neighborhood');
            $table->string('address')->nullable();
            $table->string('latitude')->nullable();
            $table->string('longitude')->nullable();
            $table->string('nivel_zoon')->nullable();
            $table->string('favicon')->nullable();
            $table->string('logo_light')->nullable();
            $table->string('logo_dark')->nullable();
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
        Schema::dropIfExists('partners');
    }
};

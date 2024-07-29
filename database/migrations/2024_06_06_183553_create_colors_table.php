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
        Schema::create('colors', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->string('hex_code')->nullable(); // Código hexadecimal opcional
            $table->text('description')->nullable(); // Descrição opcional
            $table->string('image')->nullable();
            $table->text('action_user')->nullable();
            $table->boolean('discontinued')->default(false);
            $table->boolean('deleted')->default(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('colors');
    }
};

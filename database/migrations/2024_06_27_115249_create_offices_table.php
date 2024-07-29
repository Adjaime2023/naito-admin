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

        Schema::create('offices', function (Blueprint $table) {
            $table->id();
            $table->foreignId('sector_id')->constrained()->onDelete('cascade');
            $table->string('name');
            $table->text('description')->nullable(); // Descrição opcional
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
        Schema::dropIfExists('offices');
    }
};

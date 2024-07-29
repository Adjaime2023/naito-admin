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
        Schema::create('groups', function (Blueprint $table) {
            $table->id();
            $table->foreignId('subcategory_id')->constrained('subcategories');
            $table->string('name')->unique();
            $table->text('description')->nullable();
            $table->string('image')->nullable();
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
        Schema::dropIfExists('groups');
    }
};

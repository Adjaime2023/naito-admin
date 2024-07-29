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
        Schema::create('nfe_impostos', function (Blueprint $table) {
            $table->id();
            $table->foreignId('nfe_item_id')->constrained()->onDelete('cascade');  
            $table->string('tipo_imposto');
            $table->decimal('valor_base_calculo', 10, 2)->nullable();
            $table->decimal('valor_imposto', 10, 2)->nullable();
            $table->decimal('aliquota', 5, 2)->nullable();
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
        Schema::dropIfExists('nfe_impostos');
    }
};

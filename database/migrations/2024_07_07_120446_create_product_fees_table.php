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
        Schema::create('product_fees', function (Blueprint $table) {
            $table->id();            
            $table->foreignId('product_id')->constrained('products')->onDelete('cascade');
            $table->decimal('taxes_gov', 5, 2)->nullable();
            $table->decimal('tax_gateway', 5, 2)->nullable();
            $table->decimal('tax_platform', 5, 2)->nullable();
            $table->decimal('tax_marketplace', 5, 2)->nullable();
            $table->decimal('tax_intermediation', 5, 2)->nullable();
            $table->decimal('tax_commission', 5, 2)->nullable();
            $table->decimal('tax_additional_services', 5, 2)->nullable();
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
        Schema::dropIfExists('product_fees');
    }
};

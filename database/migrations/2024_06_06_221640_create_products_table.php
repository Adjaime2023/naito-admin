<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->text('description')->nullable();
            $table->string('sku')->nullable();
            $table->string('qr_code')->nullable();
            $table->string('barcode')->nullable();
            $table->decimal('purchase_price', 10, 2)->nullable();
            $table->decimal('shipping_value', 10, 2)->nullable();
            $table->decimal('cost_price', 10, 2)->nullable();
            $table->decimal('profit_margin', 5, 2)->nullable();
            $table->decimal('freight_sale', 10, 2)->nullable();
            $table->decimal('sale_price', 10, 2)->nullable();
            $table->integer('stock')->default(0);
            $table->string('image')->nullable();
            $table->string('image_hover')->nullable();
            $table->boolean('launch')->default(false);
            $table->boolean('promotion')->default(false);
            $table->decimal('promotion_price', 10, 2)->nullable();
            $table->foreignId('category_id')->nullable()->constrained('categories');
            $table->foreignId('subcategory_id')->nullable()->constrained('subcategories');
            $table->foreignId('group_id')->nullable()->constrained('groups');
            $table->foreignId('subgroup_id')->nullable()->constrained('subgroups');
            $table->foreignId('collection_id')->nullable()->constrained('collections');
            $table->foreignId('brand_id')->nullable()->constrained('brands');
            $table->foreignId('color_id')->nullable()->constrained('colors');
            $table->string('action_user')->nullable();
            $table->boolean('discontinued')->default(false);
            $table->softDeletes(); // Adiciona a coluna deleted_at
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('products');
    }
}

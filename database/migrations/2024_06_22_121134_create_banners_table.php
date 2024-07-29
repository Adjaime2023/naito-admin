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
        Schema::create('banners', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('alt');
            $table->string('description')->nullable();
            $table->string('description2')->nullable();
            $table->string('image_url_mobile')->nullable();
            $table->string('image_url_tablet')->nullable();
            $table->string('image_url_laptop')->nullable();
            $table->string('image_url_desktop')->nullable();
            $table->string('logo_light')->nullable();
            $table->string('logo_dark')->nullable();
            $table->string('url')->nullable();
            $table->enum('horizontal_alignment', ['left', 'right', 'center'])->default('center');
            $table->enum('vertical_alignment', ['top', 'center', 'bottom'])->default('center');
            $table->datetime('date')->nullable();
            $table->boolean('slide')->default(false);
            $table->boolean('banner')->default(false);
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
        Schema::dropIfExists('banners');
    }
};

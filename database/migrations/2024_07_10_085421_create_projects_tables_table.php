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
        Schema::create('projects_tables', function (Blueprint $table) {
            $table->id();
            $table->string('project_title');
            $table->text('project_description');
            $table->string('client');
            $table->date('start_date');
            $table->date('end_date');
            $table->string('category');
            $table->text('technologies_used');
            $table->text('project_images')->nullable();
            $table->string('project_url')->nullable();
            $table->text('client_testimonial')->nullable();
            $table->string('project_team');
            $table->text('results_metrics')->nullable();
            $table->text('tags')->nullable();
            $table->string('status')->default('Completed'); // Default to Completed
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
        Schema::dropIfExists('projects_tables');
    }
};

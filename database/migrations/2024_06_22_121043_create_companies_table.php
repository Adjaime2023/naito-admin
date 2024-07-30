<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('companies', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('contact');
            $table->text('support_message')->nullable();
            $table->text('description')->nullable();
            $table->text('slogan')->nullable();
            $table->text('portifolio')->nullable();
            $table->text('mission')->nullable();
            $table->text('vision')->nullable();
            $table->text('values')->nullable();
            $table->string('image_about')->nullable();
            $table->string('image_about_right')->nullable();
            $table->string('experience1')->nullable();
            $table->string('experience2')->nullable();
            $table->string('experience3')->nullable();
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
            $table->string('address');
            $table->string('number');
            $table->string('complement')->nullable();
            $table->string('neighborhood');
            $table->string('latitude')->nullable();
            $table->string('longitude')->nullable();
            $table->string('nivel_zoon')->nullable();
            $table->string('favicon')->nullable();
            $table->string('logo_light')->nullable();
            $table->string('logo_dark')->nullable();
            $table->string('image_footer')->nullable();
            $table->string('description1')->nullable();
            $table->string('link1')->nullable();
            $table->string('image_footer_botton')->nullable();
            $table->string('description2')->nullable();
            $table->string('link2')->nullable();
            $table->boolean('discontinued')->default(false);
            $table->softDeletes();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('companies');
    }
};

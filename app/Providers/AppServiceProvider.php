<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Orchestra\Parser\XmlServiceProvider; // Adicione esta linha

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->register(XmlServiceProvider::class); // Adicione esta linha
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}

<?php

namespace App\Providers;

use App\Repository\PostalcodeRepository;
use App\Repository\Interfaces\PostalcodeRepositoryInterface;
use Illuminate\Support\ServiceProvider;

class PostalcodeServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind(
            PostalcodeRepositoryInterface::class, 
            PostalcodeRepository::class
        );
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}

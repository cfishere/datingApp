<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\View\View;
use App\DatingProfile;

class TabsServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {        
        $this->displayViewDatingProfilesTabs();

    }

    //bind profile data into tabs sidebar for displaying
    //profiles filtered on gender (opposite sex of the auth user)
    public displayViewDatingProfilesTabs()
    {
         view()->composer('', function($view){

            //TODO: Set dynamic gender bool based upon the auth user's
            // profiles seeking_gender value (consider profiles.* route.)
           $view()->with( 'datingprofiles.show',  DatingProfile::where(['gender' => Auth::user()->seeking_gender, 
            'online' => '1', 'active' => '1'])->limit('20')->get() );
        }
    }

}

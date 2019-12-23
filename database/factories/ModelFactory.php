<?php

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| Here you may define all of your model factories. Model factories give
| you a convenient way to create models for testing and seeding your
| database. Just tell the factory how a default model should look.
|
*/

/** @var \Illuminate\Database\Eloquent\Factory $factory */
$factory->define(App\User::class, function (Faker\Generator $faker) {
    static $password;

    return [       
    	'name' => $faker->firstName,
        'lname' => $faker->lastName,
        'role_id' => 2,
        'password' => $password ?: $password = bcrypt('1buckeye'),
        'email' => $faker->email, 
        'remember_token' => Str::random(10),	      
    ];
});



$factory->define(App\Thread::class, function (Faker\Generator $faker) {

	//form,to,subj,body,status
    return [       
    	'content' => json_encode([ 
    		'to' => Factory('App/User')->create()->id,
    		'from'  => Factory('App/User')->create()->id,
    		'subj' => $faker->sentence,
        	'body' => $faker->lastName,
        	'status' => 2])     	      
    ];
});
$factory->define(App\Message::class, function (Faker\Generator $faker) {
	//form,to,subj,body,status
    return [       
    	'thread_id' => Factory('App/Thread')->create()->id,
    	'user_id' => Factory('App/User')->create()->id
    ];
});

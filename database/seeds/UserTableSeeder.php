<?php

use Illuminate\Database\Seeder;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
     public function run() {
	    $faker = Faker\Factory::create();

	    for($i = 0; $i < 200; $i++) {
	        App\User::create([
	        	'name' => $faker->firstName,
	            'lname' => $faker->lastName,
	            'role_id' => 2,
	            'password' => $password ?: $password = bcrypt('1buckeye'),
	            'email' => $faker->email, 
	            'remember_token' => Str::random(10),
	        ]);
	    }
	}
}

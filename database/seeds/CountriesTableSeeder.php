<?php

use Illuminate\Database\Seeder;

class CountriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
$countriesArray = 	[['name' => 'Unisted States', 'abbr' => 'USA']];
				foreach($countriesArray as $ctry){

					DB::table('countries')->insert(
						$ctry
					);

				}
    }
}

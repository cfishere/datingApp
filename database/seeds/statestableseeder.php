<?php

use Illuminate\Database\Seeder;

class statestableseeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

    	$statesArray = [
    		     	['name' => 'Alaska', 'abbr' => 'AK', 'country_id' => 1],
					['name' => 'Alabama', 'abbr' => 'AL', 'country_id' => 1],
					['name' => 'Arkansas', 'abbr' => 'AR', 'country_id' => 1],
					['name' => 'Arizona', 'abbr' => 'AZ', 'country_id' => 1],
					['name' => 'California', 'abbr' => 'CA', 'country_id' => 1],
					['name' => 'Colorado', 'abbr' => 'CO', 'country_id' => 1],
					['name' => 'Connecticut', 'abbr' => 'CT', 'country_id' => 1],
					['name' => 'District of Columbia', 'abbr' => 'DC', 'country_id' => 1],
					['name' => 'Delaware', 'abbr' => 'DE', 'country_id' => 1],
					['name' => 'Florida', 'abbr' => 'FL', 'country_id' => 1],
					['name' => 'Georgia', 'abbr' => 'GA', 'country_id' => 1],
					['name' => 'Hawaii', 'abbr' => 'HI', 'country_id' => 1],
					['name' => 'Iowa', 'abbr' => 'IA', 'country_id' => 1],
					['name' => 'Idaho', 'abbr' => 'ID', 'country_id' => 1],
					['name' => 'Illinois', 'abbr' => 'IL', 'country_id' => 1],
					['name' => 'Indiana', 'abbr' => 'IN', 'country_id' => 1],
					['name' => 'Kansas', 'abbr' => 'KS', 'country_id' => 1],
					['name' => 'Kentucky', 'abbr' => 'KY', 'country_id' => 1],
					['name' => 'Louisiana', 'abbr' => 'LA', 'country_id' => 1],
					['name' => 'Massachusetts', 'abbr' => 'MA', 'country_id' => 1],
					['name' => 'Maryland', 'abbr' => 'MD', 'country_id' => 1],
					['name' => 'Maine', 'abbr' => 'ME', 'country_id' => 1],
					['name' => 'Michigan', 'abbr' => 'MI', 'country_id' => 1],
					['name' => 'Minnesota', 'abbr' => 'MN', 'country_id' => 1],
					['name' => 'Missouri', 'abbr' => 'MO', 'country_id' => 1],
					['name' => 'Mississippi', 'abbr' => 'MS', 'country_id' => 1],
					['name' => 'Montana', 'abbr' => 'MT', 'country_id' => 1],
					['name' => 'North Carolina', 'abbr' => 'NC', 'country_id' => 1],
					['name' => 'North Dakota', 'abbr' => 'ND', 'country_id' => 1],
					['name' => 'Nebraska', 'abbr' => 'NE', 'country_id' => 1],
					['name' => 'New Hampshire', 'abbr' => 'NH', 'country_id' => 1],
					['name' => 'New Jersey', 'abbr' => 'NJ', 'country_id' => 1],
					['name' => 'New Mexico', 'abbr' => 'NM', 'country_id' => 1],
					['name' => 'Nevada', 'abbr' => 'NV', 'country_id' => 1],
					['name' => 'New York', 'abbr' => 'NY', 'country_id' => 1],
					['name' => 'Ohio', 'abbr' => 'OH', 'country_id' => 1],
					['name' => 'Oklahoma', 'abbr' => 'OK', 'country_id' => 1],
					['name' => 'Oregon', 'abbr' => 'OR', 'country_id' => 1],
					['name' => 'Pennsylvania', 'abbr' => 'PA', 'country_id' => 1],
					['name' => 'Rhode Island', 'abbr' => 'RI', 'country_id' => 1],
					['name' => 'South Carolina', 'abbr' => 'SC', 'country_id' => 1],
					['name' => 'South Dakota', 'abbr' => 'SD', 'country_id' => 1],
					['name' => 'Tennessee', 'abbr' => 'TN', 'country_id' => 1],
					['name' => 'Texas', 'abbr' => 'TX', 'country_id' => 1],
					['name' => 'Utah', 'abbr' => 'UT', 'country_id' => 1],
					['name' => 'Virginia', 'abbr' => 'VA', 'country_id' => 1],
					['name' => 'Vermont', 'abbr' => 'VT', 'country_id' => 1],
					['name' => 'Washington', 'abbr' => 'WA', 'country_id' => 1],
					['name' => 'Wisconsin', 'abbr' => 'WI', 'country_id' => 1],
					['name' => 'West Virginia', 'abbr' => 'WV', 'country_id' => 1],
					['name' => 'Wyoming', 'abbr' => 'WY', 'country_id' => 1]
				];
				foreach($statesArray as $state){

					DB::table('states')->insert(
						$state
					);

				}
      
    }
}

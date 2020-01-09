<?php

namespace App\Http\Repository;

use App\DatingProfile;
use App\User;
use App\PostalCode;
use App\Http\Repository\Interfaces\PostalcodeRepositoryInterface;

/* 
 * Returns collection of postalcodes within $miles radius of 
 * datingprofile's postalcode
 */

class PostalcodeRepository implements PostalcodeRepositoryInterface
{
    public function all()
    {
        return PostalCode::all();
    }

    public function getAllWithinRadius( $datingProfile, $miles = 25 )
    {
    	//get the user's postalcode info, including lat, lon:
    	$centerZipcode = PostalCode::where( 'zip', '=', $datingProfile->postalcode )->first();
    	//dd($centerZipcode);
    	$latCenter = $centerZipcode->latitude;
    	$lonCenter = $centerZipcode->longitude;
    	
    	//earth's radius in miles:
		$r = 3959;

		//compute max and min latitudes / longitudes for search square
        $latN = rad2deg(asin(sin(deg2rad($latCenter)) * cos($miles / $r) + 
        	cos(deg2rad($latCenter)) * sin($miles / $r) * cos(deg2rad(0))));
        $latS = rad2deg(asin(sin(deg2rad($latCenter)) * cos($miles / $r) + 
        	cos(deg2rad($latCenter)) * sin($miles / $r) * cos(deg2rad(180))));
        $lonE = rad2deg(deg2rad($lonCenter) + atan2(sin(deg2rad(90)) * 
        	sin($miles / $r) * cos(deg2rad($latCenter)), cos($miles / $r) - 
        	sin(deg2rad($latCenter)) * sin(deg2rad($latN))));
        $lonW = rad2deg(deg2rad($lonCenter) + atan2(sin(deg2rad(270)) * 
        	sin($miles / $r) * cos(deg2rad($latCenter)), cos($miles / $r) - 
        	sin(deg2rad($latCenter)) * sin(deg2rad($latN))));
        
        /* Eloquent Query should look like:
        $query = "SELECT * FROM postalcodes WHERE (latitude <= $latN AND latitude >= $latS AND longitude <= $lonE AND longitude >= $lonW) ... [  ]

        // AND (latitude != $latCenter AND longitude != $lonCenter) AND city != '' ORDER BY state, city, latitude, longitude";
        */

        return PostalCode::where( [
    		['latitude', '<=', $latN, 'and'], 
    		['latitude', '>=', $latS, 'and'],
    		['longitude', '<=', $lonE, 'and'],
    		['longitude', '>=', $lonW, 'and'],
    		['city', '!=', '']
        ])
        ->orderBy( 'state','desc' )
        ->get();


    }
}
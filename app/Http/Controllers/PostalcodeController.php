<?php

namespace App\Http\Controllers;

use Auth;
use App\Http\Controllers\Collection;
use Illuminate\Http\Request;
use App\Postalcode;
// users postalcode as radius center 
use App\DatingProfile;
use App\Http\Repository\PostalcodeRepository;

class PostalcodeController extends Controller
{
	public function __construct()
	{
		$this->middleware( 'auth', ['except' => [] ] );
	}


    public function index()
    {
    	$postalcodes = Postalcode::limit(10)->get();
    	return view('postalcodes.index', compact('postalcodes'));
    }

    /**
     * Return datingprofiles with postalcodes within $raduis miles
     * of logged in user's postalcode.
     *
     * @param integer $radius ( miles from centerpoint )
     */

    public function searchInRadialMiles( $radius )
    {
    	$repo = new PostalcodeRepository;
    	$datingProfile = Auth::user()->datingProfile;
    	$postalcodes = $repo->getAllWithinRadius( $datingProfile, $radius  );
    	
    	// fetch all dating profiles for each found zipcode:
        $profiles =  collect();
        $i=0;
        foreach( $postalcodes as $zip ) 
        {
        	$dp =  collect( DatingProfile::where( 'postalcode', $zip->zip )->with( 'user' )->get() );
        	$zip = collect($zip);            
           
            if( !empty( $dp[0] ) )  
            {
            	$dp->push($zip);
            	$profiles->push($dp);
				$i++;           	
            	
            }
        }

        //dd( $profiles );

  		//$profiles = array_merge($profiles, $postalcodes->toArray());
    	
    	return view('postalcodes.searchresult', compact('profiles'));
    }
}
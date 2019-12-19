<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Http\Requests\StoreUserData;
use App\User;

class UserController extends Controller
{
    // edit the authenticated user's profile.
    // get an auto-filled form view.
    public function edit($id)
    {

    }


    // update the authenticated user's profile.
    // patch an auto-filled form into storage.
    public function update(Request $request, $userId)
    {
  		
    }


    /**
	 * Store the user record.
	 *
	 * @param  StoreUserData  $request
	 * @return Response
	 */
    public function store(StoreUserData $request)
    {
  		// The incoming request is valid...

    	// Retrieve the validated input data...
    	$validated = $request->validated();

    	
    }
}

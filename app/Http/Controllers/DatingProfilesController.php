<?php

namespace App\Http\Controllers;

use Auth;
use App\DatingProfile;
use Illuminate\Http\Request;
use App\Http\Requests\DatingProfileRequest;

class DatingProfilesController extends Controller
{
    /**
     * Implement Middleware for this Profiles
     *
     */
    public function __construct()
    {
        // 'auth' references key in
        // array $routeMiddleware, 
        // app/http/kernel.php
        // Array value = '\App\Http\Middleware\Authenticate::class'
        // RESULT: this triggers authenticate middleware for this controller.
        // WHICH: forces ALL actions in this controller to redirect to
        // login page if not authenticated.
        $this->middleware('auth', ['except' => 'index']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(DatingProfile $profiles)
    {
        //is this an authenticated user w/ profile
        //having a preferred gender s/he is seeking?
      /*  $g;
        if( Auth::User()->id )
        {
           $g =  Profile()->first()
                ->where( 'user_id', Auth::User()->id )
                ->seeking_gender;
        }
        else
        {
            $g=0;
        }
*/
        //$profiles = DatingProfile()->getRegionalProfiles($g);
       
        
        return view('datingprofiles.list', compact('profiles'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
        return view('datingprofiles.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  CreateProfileRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store( DatingProfileRequest $request )
    {
       
        /**
         * bc Request is type-hinted, Laravel knows to perform 
         * form validation (within CreateProfileRequest) before 
         * executing any store method code, below.
         */        

        /*
        'dob' => request('dob'),
        'bio' => request('bio'),
        'state' => request('state'),
        'seeking' => request('dob'),
        'interests' => request('interests'),
        'values' => request('values'),
        'likes' => request('likes'),
        'matches' => request('matches'),
        'favorites' => request('favorites'),
        'city' => request('city'),
        'postalcode' => request('postalcode'),
        'active' => request('active'),
        'account' => request('account'),
        'notes' => request('notes')      
        */

        $profile = new DatingProfile( $request->all() );
        //to set the FK user_id fld on Profile,
        //reference the table relationship betw users/profiles:

        // READS LIKE:
            //Get Authenticated User's Profile, save new one.
        Auth::user()->datingProfile()->save( $profile );
        
        
        return redirect('datingprofiles/'.Auth::user()->id);
       // return ['message' => 'Your Profile Has Been Created.!'];
    }
    

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $datingProfile = new DatingProfile;
        $profile = DatingProfile::findOrFail($id);
        return view( 'datingprofiles.show', compact('profile') );
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(DatingProfileRequest $request, $id)
    {

        //if updated fields validate...
        //track down the profile for this request:
        $profile = DatingProfile::findOrFail($id);

        $profile->update($request->all());
        return redirect("profiles");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}

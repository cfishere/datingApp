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
     * Filter listing on seeking_gender field.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(DatingProfile $datingProfile)
    {
        $profiles;
        
        // Param values expected: "Female" or "Male"
        // Try to return profiles listing based on current user's
        // seeking_gender answer, else return non-gendered listing.  
        if( !is_null( Auth::user() ) )
        {
            $seeking_gender = Auth::user()->datingProfile->seeking_gender;
            $profiles = $datingProfile->profilesByGender($seeking_gender);
            //return view('datingprofiles.list', compact('profiles'));
        }
        else
        {
            //else return a non-gendered listing of all profiles 
            // TODO: Order these by gender.
            // redirect to a guest version of the homepage
            // having limited functionality.
             $profiles = $datingProfile->all();
            return view( '/welcome', compact('profiles') );
        }

 //return redirect()->route( 'welcome', compact('profiles') );

        return view('datingprofiles.list', compact('profiles'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {   
        //guest users are redirected from this view.
        $user = Auth::user();
        $profile;
        if( $profile = $user->datingProfile()->first() )
        {
            // For a route with the following URI: profile/{id}/edit

           //return redirect()->route('profile', ['id' => 1]);
            return redirect()->route( 'datingprofiles.edit', compact('profile') );
        }
        $profile = new DatingProfile;
        return view( 'datingprofiles.create', compact('profile') );
    }

   
    /**
     * Store a newly created resource in storage.
     *
     * @param  CreateProfileRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store( Request $request )
    {
        
        //does this user already have a profile, if so,
        //send them to the edit page for that profile.
        //else, validate the form data, save new, redirect
        //to view the newly created profile.
        //
    
        // firstOrNew checks to see if record exists:
        // i.e,.  Retrieve by field, or instantiate new if not found...
        // If not found, a new empty model instance is returned 
        // (which must still be filled with request data & persisted.)
        // 
        $profModel = DatingProfile::firstOrNew( [ 'user_id' => Auth::user()->id ] );
        if( !isset( $profModel->id ) )
        {     
            $profModel = new DatingProfile( $request->all() );

            //dating_profile->id will only be set if it retrieved existing profile from DB.            
            Auth::user()->datingProfile()->save( $profModel );

            //get the newly-generated id to pass to the view:
            $profModel = Auth::user()->datingProfile();
           
            //return view('datingprofiles.edit', compact('profModel') ); 
        }

        return redirect()->route('datingprofiles.show'); 
    }
    

    /**
     * Display the specified resource.
     *
     * @param  object  $datingprofile
     * @return \Illuminate\Http\Response
     */
    public function show(DatingProfile $datingprofile)
    {
        return view( 'datingprofiles.show', compact('datingprofile') );        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

        //this should only be the id of the auth::user
        //on the user_id of dating_profiles table.
        //Auth middleware already redirects away unauthed users (guests)
        //but authed users would still access any users profile edit page.
        //
            
        //route passes in what is hopefully the dating_profile id,
        //not the user id.
        $profile = DatingProfile::where( 'user_id','=', Auth::user()->id )->first();

        if( $profile->id )
        {
            $id = $profile->id;
            return view( 'datingprofiles.edit', compact( 'profile' ) );
        }
        else
        {
             return redirect()->route( 'datingprofiles.create' );
        }
        
        
               
        //return view( 'datingprofiles.edit', compact( 'profile' ) );
       
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        //if updated fields validate...
        //track down the profile for this request:
        $profile = DatingProfile::findOrFail($id);

        $profile->update( $request->all() );
        return redirect('datingprofiles');
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

    /**
     * Fetch list of profiles from storage.
     *
     * @param string $seeking_gender (Mutated by Model from int)
     * @return \Illuminate\Http\Response
     */
    
    public function getGenderSpecificProfiles($seeking_gender){

        //Param values expected: "Female" or "Male"
        //        
        $seeking_gender = ucfirst(strtolower($seeking_gender));

        $female = "1"; $male = "0";
        if ( $seeking_gender === "Female" ? $female : $male );

        $profiles = DatingProfile::all()
            ->where("seeking_gender", "=", $seeking_gender);

        return view('datingprofiles.list', compact('profiles'));
    }
}

<?php

namespace App\Http\Controllers;

use Auth;
use App\DatingProfile;
use App\Tag;
use Illuminate\Http\Request;
//use App\Http\Requests\DatingProfileRequest;

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
        $this->middleware( 'auth', ['except' => ['index','show'] ] );
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

        if( request('tag') )
        {
            $profiles = Tag::where('name', request('tag'))->firstOrFail()->datingProfiles;
        } 
        else
        {
        
        // Param values expected: "Female" or "Male"
        // Try to return profiles listing based on current user's
        // seeking_gender answer, else return non-gendered listing.
        if( !is_null( Auth::user() ) && !is_null( Auth::user()->datingProfile ) )
        {
            $gender = Auth::user()->datingProfile->gender;
            // get profiles w/ users+gallery related tbls, filtered by 
            // current user's seeking_gender field value.
            $profiles = $datingProfile->profilesByGender($gender);
        }
        else
        {
            //else return a non-gendered listing of all profiles 
            // TODO: Order these by gender.
            // redirect to a guest version of the homepage
            // having limited functionality.
             
             $profiles = $datingProfile->latest()->paginate(10);
            // dd($profiles);
            return view( 'welcome', compact('profiles') );
        }
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
    public function store( Request $request, DatingProfile $dp )
    {        
        $data = $request->except('_token','submitBtnText');
       
        $data['user_id'] = auth()->id();
        $data['seeking_gender'] = $dp->setSeekingGenderAttribute($data['seeking_gender']);
        $data['gender'] = $dp->setGenderAttribute($data['gender']);
        $data['dob'] = $dp->setDobAttribute($data['dob']);
        //TODO: convert state into the state ID for the db storage.  
        $data['state_id'] = 17; //hardcode an int state for now.
        $id = $dp->insertGetId($data);
        // dd($data);       
     // good article on pivot tbls:
     // https://laraveldaily.com/pivot-tables-and-many-to-many-relationships/
        /* Laravel: You Can Save models AND relationships using push()
            $user = User::first();
            $user->name = "Peter";
            $user->phone->number = '1234567890';
            $user->push(); // This will update both user and phone record in DB
        */       
             
        return redirect()->route("/datingprofiles/$id"); 
    }
    
    /**
     * Display the specified resource.
     *
     * @param  object  $datingprofile
     * @return \Illuminate\Http\Response
     */
    public function show( DatingProfile $datingProfile, $id )
    {     
        $profile;       

       if( empty( $datingProfile::findOrFail($id) ) )
        { 
            return view('notfound');
        }
        else
        {
           $profile = $datingProfile::with( ['user'] )->where( 'id', '=', $id )->first();        
        }       
        // dd($profile);
        
        //$profile = $profile->toArray();
        //
        //gallery field example: {"images":{"main":"faker_profile_img_f1.jpg"}}
        //$profile->gallery = json_decode($profile->gallery, true);
      
        return view( 'datingprofiles.show', compact('profile') );
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id (dating_profiles.id)
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {        
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


    // TAG-RELATED ACTIONS **************************************
    
    /**
     * [listProfilesForTag description]
     * @param  int $id tag id
     * @return Response View w/ Profiles List
     */
    public function listProfilesForTag($id)
    {
       
        $tag = new \App\Tag;
        $profiles = $tag::with('datingProfiles')->where('id', '=', $id)->first();
            
        return view('datingprofiles.listbytag', compact('profiles'));
    }
    


}

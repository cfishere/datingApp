<?php
namespace App\Http\Profiles;
// Our custom package 'Myopicseer/Profile' extended here:

Class Males extends Profile
{
	//for testing purposes, populate some dummie data:
	public $profiles = [['name'=>'Charlie', 'lname'=>'Rose', 'dob'=>'Oct, 22, 1977', 'bio'=>'Just a regular dude.', 'gender'=>'Male', 'gender_seeking'=>'Female', 'state_id'=>'4', 'city'=>'Tropolis'], ['name'=>'Shane', 'lname'=>'Grossman', 'dob'=>'Nov, 1, 1998', 'bio'=>'Just another type of regular dude.', 'gender'=>'Male', 'gender_seeking'=>'Female', 'state_id'=>'12', 'city'=>'Smithville']];


	public $title = "Male Profiles";

	public function view()
	{
		return view('profiles.male');
	}

}
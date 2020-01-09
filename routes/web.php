<?php

/* test our custom package Myopicseer/Profile:

Route::get('myopicseerpackage', function(){
	return Myopicseer\Profile\profile::test();
});
*/

Route::get('myopicseerpackage', function(){
	return view('profiles/male');
});

// TESTING routes:
/*Route::get('search/datingprofiles/postalcode/{postalcode}/{radialMiles}', 'PostalcodeController@index' );
*/
// END TESTING routes.

Route::get('postalcodes/index', 'PostalcodeController@index' );
Route::get('postalcodes/q/{radius}', 'PostalcodeController@searchInRadialMiles');
//show profiles having tag id of {id}
Route::get('datingprofiles/tag/{id}', 'DatingProfilesController@listProfilesForTag');


//profile
Route::resource('datingprofiles', 'DatingProfilesController');
//Route::resource('messages', 'MessageController');
Route::resource('messages.threads', 'ThreadController@index');

//view gender-specific profiles
//Route::resource('datingprofiles/{$seeking_gender}', 'DatingProfilesController@getGenderSpecificProfiles');

//Message
//Route::post('messages/store', 'MessagesController@store');

//get new message form
//Route::get('messages/create', 'MessagesController@create')
//->middleware('verified');

//show list in inbox for user with id {id}
//Route::get('messages/{id}', 'MessagesController@index')
//->middleware('verified');

// Thread
// Route::get('messages/thread/{id}', 'ThreadsController@show');

// Regions (states, provinces, etc. for country @{id})
Route::get('/regions/{id}', function(Request $request) {
	return $request->regions;
});

//
Route::get('/', 'DatingProfilesController@index');

Auth::routes(['verify' => true]);

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

// frontend user account management
// Show the form for editing (get)
Route::get('user.edit', 'UserController@edit');

// Submit the Edited Form to Storage (patch)
Route::patch('user.update', 'UserController@update');

// 404 fallback route
Route::fallback(function ()
{
    return view('notfound');
});


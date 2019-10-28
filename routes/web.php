<?php

//profile
Route::resource('datingprofiles', 'DatingProfilesController');

//view gender-specific profiles
//Route::resource('datingprofiles/{$seeking_gender}', 'DatingProfilesController@getGenderSpecificProfiles');

//Message
Route::post('messages/store', 'MessagesController@store');

//get new message form
Route::get('messages/create', 'MessagesController@create')
->middleware('verified');

//show list in inbox for user with id {id}
Route::get('messages/{id}', 'MessagesController@index')
->middleware('verified');

//Thread
Route::get('messages/thread/{id}', 'ThreadsController@show');

//Regions (states, provinces, etc. for country @{id})
Route::get('/regions/{id}', function(Request $request) {
	return $request->regions;
});

//
Route::get('/welcome', 'DatingProfilesController@index');

Auth::routes(['verify' => true]);

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

//404 fallback route
Route::fallback(function () 
{
    
});
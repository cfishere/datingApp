<?php


//profile
//Route::resource('datingprofiles', 'DatingProfilesController');
Route::get('datingprofiles', 'DatingProfilesController@index');
Route::get('datingprofiles/{datingprofile}', 'DatingProfilesController@show');
Route::get('datingprofiles/create', 'DatingProfilesController@create');
Route::post('datingprofiles/create', 'DatingProfilesController@store');

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
Route::get('/', 'HomeController@index')->name('home');

Auth::routes(['verify' => true]);




Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

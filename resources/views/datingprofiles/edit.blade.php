
@extends('layouts\app')
      

 @section('title')
 Update your profile
 @stop

@section('content')

 @if (session('error'))
	<div class="alert alert-danger">{{ session('error') }}</div>
@endif
{!! Form::model($profile, ['method' => 'patch', 'action' => ['DatingProfilesController@update', $profile->id ]]) !!}

	@include('datingprofiles.form', ['submitBtnText.label' => 'Edit Profile'])

{!! Form::close() !!}

<!-- form:model binding; bind the model object to this form -->


 

@stop
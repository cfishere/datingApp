@extends('layouts\app')
 @section('title')
 View Member Profiles
 @stop
 @section('content')
@if (count($profiles))
	<h1 class="title is-3">View Member Profiles</h1>
@if (session('error'))
	<div class="alert alert-danger">{{ session('error') }}</div>
	@include('errors.list')
@else
	<ul>	
		@foreach ($profiles as $profile)
			<li>
				
				
				<br>
				<span>NAME: {{ $profile->user->name }} DOB: {{ $profile->dob }}</span>
				<br>
				<span>-- Gender: {{ $profile->gender }}</span>
				<br>
				<span>-- Seeking: {{ $profile->seeking_gender }}</span>
			</li>
		@endforeach
	</ul>
	
	@endif

@endif
@stop 
        


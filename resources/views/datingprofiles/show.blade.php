
@extends('layouts.app')

@section('content')
{{var_dump($profile)}}
	
<h1>Profile for {{ $profile->user->name }} {{ $profile->user->lname }}</h1>
	<hr>

	<ul>
		<li>BIO: {{ $profile->bio }}</li>
		<li>GENDER: {{ $profile->gender }}</li>
		<li>SEEKING: {{ $profile->seeking_gender }}</li>
		<li>DOB: {{ $profile->dob }}</li>
	</ul>
@endsection

@section('footer')
<p>I am footer content for the show blade view.</p>
@endsection
	


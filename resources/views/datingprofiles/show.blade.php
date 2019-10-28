
@extends('layouts.app')

@section('content')
	
<h1>Profile for {{ $datingprofile->user->name }} {{ $datingprofile->user->lname }}</h1>
	<hr>

	<ul>
		<li>BIO: {{ $datingprofile->bio }}</li>
		<li>GENDER: {{ $datingprofile->gender }}</li>
		<li>SEEKING: {{ $datingprofile->seeking_gender }}</li>
		<li>DOB: {{ $datingprofile->dob }}</li>
	</ul>
	@if( $datingprofile->user_id === Auth::user()->id )
		<a href="{{ $datingprofile->id }}/edit">Edit</a>
	@endif
@endsection

@section('footer')
<p>I am footer content for the show blade view.</p>
@endsection
	


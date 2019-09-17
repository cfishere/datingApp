@if (count($profiles))
	<h1 class="title is-3">View Profiles Listing</h1>

	<ul>
		@foreach $profiles as profile
			<li>
				Memeber is located in state: <a href="#">{{ $profile->state }}</a>
				<br>
				<span>NAME: {{ profile()->user()->name }} DOB: {{ $profile->dob }}</span>
				<br>
				<span>-- Gender: {{ $profile->gender }}</span>
				<br>
				<span>-- Seeking: {{ $profile->seeking_gender }}</span>
			</li>
		@endforeach
	</ul>

	<hr>
@endif

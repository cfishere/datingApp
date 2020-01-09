@extends('layouts.app')

@section('content')

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">List of Postalcodes</div>
                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                </div>                    
					<article>
                        {{ dd( $profiles ) }}                            
                        @foreach( $profiles as $collection )    
                             @foreach( $collection as $profile )  

                        <div class="card">
                              <header class="card-header">
                                <p class="card-header-title is-centered">
                                  {{ $profile['DatingProfile']['user']['name'] }}
                                </p>
                                <a href="/datingprofile/{{$profile['DatingProfile']['id']}}" class="card-header-icon" aria-label="more options">
                                  <span class="icon is-small">
                                    <i class="fas has-text-info" aria-hidden="true"></i>
                                    {{$profile['DatingProfile']['user']['name']}}
                                  </span>
                                </a>
                              </header>
                              <div class="card-content">
                                <div class="content">
                                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec iaculis mauris.
                                  <a href="#">@bulmaio</a>. <a href="#">#css</a> <a href="#">#responsive</a>
                                  <br>
                                  <time datetime="2016-1-1">11:09 PM - 1 Jan 2016</time>
                                </div>
                              </div>
                              <footer class="card-footer">
                                <a href="#" class="card-footer-item">Save</a>
                                <a href="#" class="card-footer-item">Edit</a>
                                <a href="#" class="card-footer-item">Delete</a>
                              </footer>
                            </div>






							<div class="columns">
                                <div class="column">

                                </div>                                        
							</div>  
                            @endforeach  
                        @endforeach                           
					</article>				
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
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
						<article>
                            <ul>
                                @foreach($postalcodes as $zip)        							
    								<li>
                                        {{$zip->city}}, {{$zip->state}}, {{$zip->zip}}	
    								</li>  
                                @endforeach
                            </ul>
						</article>				
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
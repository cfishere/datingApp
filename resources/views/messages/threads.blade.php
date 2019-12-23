@extends('layouts.app')

@section('content')

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Message Threads</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    
					@foreach($threads as $thread)
						<article>
							<ul>
								<li>Thread belongs to Message No. {{$thread->message->id}}
									@foreach($thread->content)
										<li>{{$thread->content->body}}</li>
									@endforeach
								</li>
							</ul>
						</article>
					@endforeach
					
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
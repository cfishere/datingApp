

@extends('layouts\app')
      

 @section('title')
 Create your profile
 @stop
 @section('content')
         <h1>Create Your Profile</h1>
         @if (session('error'))
			<div class="alert alert-danger">{{ session('error') }}</div>
		@endif
        
           <div id="app">
           		
           		@include('datingprofiles.form', ['submitBtnText' => 'Create Profile'])  

        	{!! Form::close() !!}
        </div>
       <script src="//cdnjs.cloudflare.com/ajax/libs/axios/0.15.3/axios.js"></script>
    <script src="//unpkg.com/vue@2.1.6/dist/vue.js"></script>
    <script src="/js/app.js" defer></script>
    @include('errors.list')
@stop 
        
    

    

   

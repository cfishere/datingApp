<@extends('layouts\app')
 @section('title')
 View Member Profiles
 @stop
 @section('content')
        <h1>Look Around</h1>
        <p>This is the view of the welcome page for a user who is in a guest role.<br/>They will have limited access to profiles.</p>
         <div id="app">
            <ul>
                {{dump($profiles)}}
               
            </ul>
             
         </div>

        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
         <script src="https://unpkg.com/vue@2.1.6/dist/vue.js"></script>
         <script src="/js/app.js"></script>
     </body> 
</html>
@stop

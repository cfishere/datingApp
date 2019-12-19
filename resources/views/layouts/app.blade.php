<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">   
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">    
    <title></title> 
    <link rel="stylesheet" href="/css/css/bulma.min.css"> 
    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">
    <!-- Styles -->
    <link href="{{ mix('css/app.css') }}" rel="stylesheet">    
</head>
<body>
    <div id="app">
        <div class="container">
        @include('partials.nav')
        <main class="py-4">
            @yield('content')
        </main>
       @include('partials.footer')
       </div>
    </div>
 <!-- Scripts -->
    <!-- Latest compiled and minified JavaScript -->
    <script
  src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
  integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8="
  crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
   


<style>
    .dropdown-menu {
  box-shadow: 0 0 8px #777;
  display: none;
  left: 0;
  position: absolute;
  top: 100%;
  z-index: 1000;
}

.is-active .dropdown-menu {
  display: block;
}
</style>

    <script>



/*
        document.getElementById("showModal").addEventListener('click', function() {
          document.getElementsByClassName("modal")[0].classList.add("is-active");  
        });

        document.getElementById("closeModal").addEventListener('click', function() {
           document.getElementsByClassName("modal")[0].classList.remove("is-active"); 
        });
*/

var dropdown = document.querySelector('.dropdown');
dropdown.addEventListener('click', function(event) {
  event.stopPropagation();
  dropdown.classList.toggle('is-active');
});
    </script>





</body>
</html>




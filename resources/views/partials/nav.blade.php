<?php 
                       /* 
<nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
            <div class="container">
                <a class="navbar-brand" href="{{ url('/') }}">
                    {{ config('app.name', 'Dating App') }}
                </a>

            
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>



                <div class="collapse navbar-collapse" id="navbarSupportedContent">


              




                    <!-- Left Side Of Navbar -->
                   <!-- <ul class="navbar-nav mr-auto">

                    </ul>
                -->

                    <!-- Right Side Of Navbar --> -->
                        <!-- Authentication Links -->
                    <!--   {{-- @guest --}}
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                            </li>
                            {{-- @if (Route::has('register'))
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                                </li>
                            @endif 
                       @else <!--not a guest -->
                            <li class="nav-item dropdown">
                               

                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        {{ __('Logout') }}
                                    </a>
                                    @if( is_object( Auth::user()->datingProfile ) )                                    
                                    <a class="dropdown-item" href="{{ '/datingprofiles/'.Auth::user()->datingProfile->id }}">
                                        My Profile
                                    </a>
                                    @else 
                                        <a class="dropdown-item" href="{{ '/datingprofiles/create' }}">
                                        My Profile
                                        </a>
                                    @endif
                                   
                                    <a class="dropdown-item" href="/datingprofiles">
                                        Browse Profiles
                                    </a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                    </form>
                                </div>
                            </li>
                        @endguest
                    </ul>
                </div>
            </div>
*/
?>


        <div class="dropdown">
  <div class="dropdown-trigger">


 @guest          
          <a class="dropdown-item is-active" href="{{ route('login') }}">{{ __('Login') }}</a>
          
          @if (Route::has('register'))
                <a class="dropdown-item" href="{{ route('register') }}">{{ __('Register') }}</a>
          @endif
      @else <!-- Not a guest -->
       <a class="dropdown-item is-active" href="#">
            {{ Auth::user()->name }} <span class="caret"></span>
        </a>


    <button class="button" aria-haspopup="true" aria-controls="dropdown-menu" aria-label="{{ __('Toggle navigation') }}">
      
      <span class="icon is-small">
        <i class="fas fa-angle-down" aria-hidden="true"></i>
      </span>
    </button>
  </div>
  <div class="dropdown-menu" id="dropdown-menu" role="menu">
    <div class="dropdown-content">
    
        <a class="dropdown-item" href="{{ route('logout') }}"
               onclick="event.preventDefault();
                             document.getElementById('logout-form').submit();">
                {{ __('Logout') }}
        </a>

        @if( is_object( Auth::user()->datingProfile ) )                                    
            <a class="dropdown-item" href="{{ '/datingprofiles/'.Auth::user()->datingProfile->id }}">
                My Profile
            </a>
            @else 
                <a class="dropdown-item" href="{{ '/datingprofiles/create' }}">
                My Profile
                </a>
        @endif

       

        
 @endguest

          <hr class="dropdown-divider">
           <a class="dropdown-item" href="/datingprofiles">
                Browse Profiles
            </a>
            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                @csrf
            </form>
        </div>
      </div>
    </div>
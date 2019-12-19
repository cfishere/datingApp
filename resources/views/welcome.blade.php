@extends('layouts\app')
 @section('title')
 View Member Profiles
 @stop
 {{--dd($profiles)--}}
 @section('content')
 Example Vue Component
 <div>
    <example-component></example-component>
 </div>
    <h1>Look Around</h1>
    <p>This is the view of the welcome page for a user who is in a guest role.<br/>They will have limited access to profiles.</p>
     
       
            @foreach ( $profiles as $prof )
                <!-- Bulma card -->
                <div class="card">
                <div class="card-content">
                <div class="media">  
                @if( !empty( $prof['gallery'] && isset($prof['gallery']['images'] ) ) )                   
                  <div class="media-left">                
                     {{-- dd($prof->gallery) --}}
                        <div class="card-image">
                          @foreach( $prof['gallery']['images'] as $img )
                          <figure>
                            <img src="images/{{ $img }}" alt="Placeholder image" style="max-height: 160px">
                          </figure>
                          @endforeach
                        </div>                                    
                  </div> 
                @endif   
                @if( $prof->user )
                    <div class="media-content">
                        <p class="title is-4">                  
                            {{ $prof->user->name .' '. $prof->user->lname }}
                        </p>
                        <p class="subtitle is-6">
                            @johnsmith
                        </p>
                        <!-- show tags for this user -->
                        @if( $prof->tags )
                            @foreach( $prof->tags as $tag )
                            <a href="datingprofiles/tag/{{$tag->id}}"> {{ $tag->name }} | </span>
                            @endforeach
                        @endif
                    </div><!-- end media-content -->
                    @endif
              </div><!--end media -->
              <div class="content">
                    {{ $prof->bio }} <a>@bulmaio</a>
                    <a href="#">#css</a> <a href="#">#responsive</a>
                    <br>
                    <time datetime="2016-1-1">11:09 PM - 1 Jan 2016</time>
              </div>
              <footer class="card-footer">
                  <a href="#" class="card-footer-item">Add to Favs</a>
                  <a href="#" class="card-footer-item">Send Message</a>
                  <!--bulma modal layout:-->
                  <div class="modal">
                    <div class="modal-background"></div>
                    <div class="modal-card">
                      <header class="modal-card-head">
                        <p class="modal-card-title">Modal title</p>
                        <button class="delete" aria-label="close"></button>
                      </header>
                      <section class="modal-card-body">
                        <!-- Content ... -->
                        {{ $prof->bio }}
                      </section>
                      <footer class="modal-card-foot">
                        <button class="button is-success">Save changes</button>
                        <button id="closeModal" class="button">Cancel</button>
                      </footer>
                    </div>                
                  </div> <!-- end modal layout --> 
                  <button id="showModal" class="is-large" aria-label="More Details"></button>
              </footer>
              </div>
              </div>

          @endforeach

        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
         <script src="https://unpkg.com/vue@2.1.6/dist/vue.js"></script>
         <script src="/js/app.js"></script>

@stop

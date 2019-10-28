

@if( isset($profile->id) )

    {!! Form::model($profile, ['method' => 'PATCH', 'action' => ['DatingProfilesController@update', $profile->id]]) !!}
@else
    {!! Form::open(['route' => 'datingprofiles.store', 'method' => 'POST']) !!}
@endif

 <div class="control">
        
        <!-- DOB REQUIRED FIELD -->
            <div class="control">
                <label for="dob" class="label">DOB:</label>
                <!--using view, v-model would supply the value for us, but without it,
                    we use curly brace blade output or empty string if null -->
                <input  type="text" id="dob" name="dob" class="input" v-model="form.dob" value="{{ old('dob', $profile->dob) }}">           

                <span class="help is-danger" v-if="form.errors.has('dob')" v-text="form.errors.get('dob')"></span>
            </div>

            <!-- GENDER is REQUIRED FIELD -->              
            <div class="control">
                <label for="gender" class="label">Gender:</label>                   
                   
                    <input type="text" id="gender" name="gender" class="input" v-model="form.gender"
                    value="{{ old('gender', $profile->gender) }}">
                    <span class="help is-danger" v-if="form.errors.has('gender')" v-on:blur="" v-text="form.errors.get('gender')"></span>
            </div>        

            <!-- SEEKING_GENDER REQUIRED FIELD -->
            <div class="control">
                <label for="seeking_gender" class="label">Seeking:</label>
                
                <input type="text" id="seeking_gender" name="seeking_gender" class="input" v-model="form.seeking_gender" value="{{ old('seeking_gender', $profile->seeking_gender) }}">

                <span class="help is-danger" v-if="form.errors.has('seeking_gender')" v-text="form.errors.get('seeking_gender')"></span>
            </div>
           

           
          <!-- City is REQUIRED FIELD --> 
             
            <div class="control">
                <label for="city" class="label">City:</label>                   
                   
                    <input type="text" id="city" name="city" class="input" v-model="form.city"
                    value="{{ old('city', $profile->city) }}">
                    <span class="help is-danger" v-if="form.errors.has('city')" v-on:blur="" v-text="form.errors.get('city')"></span>
            </div>

            <!-- STATE REQUIRED FIELD - Mutates to FK ID ref regions table on store action -->
            <div class="control">
                <label for="state_id" class="label">State:</label>
                
                <input type="text" id="state_id" name="state_id" class="input" v-model="form.state_id"
                value="{{ old('state_id', $profile->state->name) }}">

                <span class="help is-danger" v-if="form.errors.has('state')" v-text="form.errors.get('state')"></span>
            </div>

             <!-- POSTALCODE is REQUIRED FIELD -->              
            <div class="control">
                <label for="postalcode" class="label">Postal Code:</label>                   
                   
                    <input type="text" id="postalcode" name="postalcode" class="input" v-model="form.postalcode" value="{{ old('postalcode', $profile->postalcode) }}">
                    <span class="help is-danger" v-if="form.errors.has('postalcode')" v-on:blur="" v-text="form.errors.get('postalcode')"></span>
            </div>
    
            <!-- BIO REQUIRED FIELD -->
            <div class="control">
                <label for="bio" class="label">Your General Background (Bio):</label>
                
                <textarea id="bio" name="bio" class="textarea" v-model="form.bio">{{ old('bio', $profile->bio) }}
                </textarea>

                <span class="help is-danger" v-if="form.errors.has('bio')" v-text="form.errors.get('bio')"></span>
            </div>

            <!-- user_id, hidden -->
           <!-- <div class="control">               
                
                <input type="hidden" id="user_id" name="user_id" class="input" v-model="form.user_id"
                value="{{--$user->id--}}">
               
            </div> -->
        
            <div class="control">
                <button value="submitBtnText" name="submitBtnText" id="submitBtnText" class="button is-primary" :disabled="form.errors.any()"></button>
            </div>
           
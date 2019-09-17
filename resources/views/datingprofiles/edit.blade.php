
@extend('app')

@section('content')

<!-- form:model binding; bind the model object to this form -->

{!! form::model($profile, ['method' => 'patch', 'action' => ['ProfilesController@update', $profile->id ]]) !!}


{!! form::close !!}

@stop
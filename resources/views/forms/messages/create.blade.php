{!! Form::model($message, ['action' => 'MessageController@store']) !!}
	
	<div class="form-group">
      {!! Form::label('From', 'from') !!}
      {{--{0:{'from':'2' 'to':'14', 'subj':'blah', 'content':'foobar', 'status':'set to bool true once read by recipient'}--}}
      {!! Form::text('from', '', ['class' => 'form-control']) !!}
    </div>

    <div class="form-group">
      {!! Form::label('To', 'to') !!}     
      {!! Form::text('to', '', ['class' => 'form-control']) !!}
    </div>

	<div class="form-group">
      {!! Form::label('Subj', 'subj') !!}
      {{--{0:{'from':'2' 'to':'14', 'subj':'blah', 'body':'foobar', 'status':'set to bool true once read by recipient'}--}}
      {!! Form::text('subj', '', ['class' => 'form-control']) !!}
    </div>

    <div class="form-group">
      {!! Form::label('Message', 'message') !!}
      {!! Form::textarea('body', '', ['class' => 'form-control']) !!}
    </div>

    <button class="btn btn-success" type="submit">Send</button>

{!! Form::close() !!}
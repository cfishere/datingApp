
@if (count($states))
	<select type="text" id="state" name="state" class="input" v-model="form.state">
		<!-- Label will become something like $lang->region -->
		 <option value="0">-STATE-</option>
		@foreach ($states as $state)
			<option value="{{ $state->abbr }}">$state->name</option>
		@endforeach
	</select>
@endif
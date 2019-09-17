@if (count($states))	
	<select id="country" name="country" class="input" v-model="form.country">		
		 <option value="0">-COUNTRY-</option>
		@foreach ($countries as $country)
			<option value="{{ $country->abbr }}">$country->name</option>
		@endforeach
	</select>	
@endif
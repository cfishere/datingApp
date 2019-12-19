<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{

	public function datingProfiles()
	{

		return $this->belongsToMany('App\DatingProfile');

	}


}

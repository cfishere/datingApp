<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/* US states model */

class State extends Model
{
    public function country()
    {
    	return $this->belongsTo('App\Country', 'country_id');
    }
    public function datingProfile()
    {
    	return $this->hasMany('App\DatingProfile');
    }
}

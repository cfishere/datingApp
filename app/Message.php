<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
	protected $fillable = ['*'];
	protected $guarded = ['id'];
    //
    public function thread()
    {
    	return $this->hasOne('App\Thread', 'thread_id');
    }

    public function user()
    {
    	return $this->belongsTo('App\User', 'user_id');
    }

}
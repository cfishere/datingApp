<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Thread extends Model
{
    //
    public function message()
    {
    	return $this->belongsTo('App\Message')
    }

    /**
     * compile form submission thread data into json 
     * @param array $contents, result submitted by the user
     */
    public function setContentsAttribute($contents)
    {
    	//json structure needed for tbl threads, field content: 
    	//{'from':2 'to':14, 'subj':'blah', 'content':'foobar', 
    	//'status':'set to bool true once read by recipient'}
    	
    	$this->attributes['contents'] = json_encode($contents);
    }

    /**
     * Transform json to array for view
     * @param  json str $contents 
     */
    public function getContentsAttribute($contents)
    {
    	$this->attributes['contents'] = json_decode($contents, true);
    }
}

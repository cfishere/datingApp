<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class Tag extends Controller
{
   protected $fillable = ['*']
   
   public function datingProfiles()
   {
   		return $this->belongsToMany('App\DatingProfile', 'dating_profile_tag', 'dating_profile_id', 'tag_id');
   }
}

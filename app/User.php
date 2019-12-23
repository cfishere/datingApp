<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends \TCG\Voyager\Models\User implements MustVerifyEmail
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'lname', 'mname',
        'secret', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
        'secret',
    ];

    public function datingProfile()
    {
        return $this->hasOne('App\DatingProfile');
    }

    public function message()
    {
        $this->hasMany('App\Message');
    }

    public function billing()
    {
        return $this->hasOne('App\Billing');
    }

    public function fullName()
    {
        $m = ( empty($this->mname) ? " " : " ".$this->mname." ");
        return $this->name .$m. $this->lname;
    }
}

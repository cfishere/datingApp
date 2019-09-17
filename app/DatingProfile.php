<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;
use Carbon\Carbon;

class DatingProfile extends Model
{
	use Searchable;


	protected $fillable = [
		'dob','state','country','postalcode','gender','seeking_gender','seeking_desc','interests','values','likes','matches','favorites','appearance',
	];
		

	 /**
     * Get the index name for the model.
     *
     * @return string
     */
    
	 
    public function searchableAs()
    {
        return 'dating_profiles_index';
    }

	public function user()
	{
		return $this->belongsTo('App\User', 'user_id');
	}
/* Mutator not needed for any date storage
	public function setDobAttribute($dob){
		$this->attributes['dob'] = Carbon::createFromFormat('m/d/Y', $dob);
	}
	*/

	/* Accessor, format dob date from 2000-01-20 to readable format 
	* 
	* */
	
	public function getDobAttribute($dob){
		
		/* gives "years ago" value:
		//return	$this->attributes['dob'] = Carbon::parse($dob)->diffForHumans();
		*/
		return $this->attributes['dob'] = Carbon::parse($dob)->format('M d, Y');
		
	}

	public function getGenderAttribute($gender){
		
		return $this->attributes['gender'] = ( $gender === 0 ? 'M' : 'F' );		
	}
    
	public function getSeekingGenderAttribute($seeking_gender){
		
		return $this->attributes['seeking_gender'] = ( $seeking_gender === 0 ? 'M' : 'F' );		
	}   
   
}
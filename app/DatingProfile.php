<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
//use Laravel\Scout\Searchable;
use Carbon\Carbon;

class DatingProfile extends Model
{
	//use Searchable;


	protected $fillable = [
		'dob','state','country','city','postalcode','gender','seeking_gender','seeking_desc','interests','values','likes','matches','favorites','appearance','bio',
	];
		

	 /**
     * Get the index name for the model.
     *
     * @return string
     */
    
	/* 
    public function searchableAs()
    {
        return 'dating_profiles_index';
    }
*/
	public function user()
	{
		return $this->belongsTo('App\User', 'user_id');
	}


	public function state()
	{
		return $this->belongsTo('App\State');
	}
	
	/** 
	 * 
	 * @param string $gender (gender field accessor converts to a string)
	 * @return Model Collection
	 */
	public function profilesByGender( $gender )
	{
		//Accessor should convert gender from str to int on queries(?)
		$gender = $this->setSeekingGenderAttribute( $gender );	
		return $this->where('gender', '=', $gender)->get();
		
	}



	/* Mutator date to timestamp for storage */
	public function setDobAttribute($dob){
		//$date = Carbon::parse($dob);
		$this->attributes['dob'] = Carbon::parse($dob)->format('Y-m-d');
	}
	

	/* Accessor, format dob date from 2000-01-20 to readable format 
	* 
	* */
	public function getDobAttribute($dob){
		
		/* gives "years ago" value:
		//return	$this->attributes['dob'] = Carbon::parse($dob)->diffForHumans();
		*/
		if( empty($dob) )
		{
			//FIX: Carbon returns today's date as DOB if this DB field is empty. 
			return $this->attributes['dob'] = '';
		}
		return $this->attributes['dob'] = Carbon::parse($dob)->format('M d, Y');		
	}
	
    
	public function getSeekingGenderAttribute($seeking_gender){
		
		if( $seeking_gender === 0 )
		{
			return $this->attributes['gender'] = 'Male';
		} 
		elseif( $seeking_gender === 1 )
		{
			return $this->attributes['gender'] = 'Female';
		} 
		//if null
		return $this->attributes['gender'] = '';				
	}   


	public function getGenderAttribute( $gender ){		
		
		if( $gender === 0 )
		{
			return $this->attributes['gender'] = 'Male';
		} 
		elseif( $gender === 1 )
		{
			return $this->attributes['gender'] = 'Female';
		} 
		//if null
		return $this->attributes['gender'] = '';		
	}


	/** Mutator Field gender
	*	
	*	@param int ( 0 || 1)
	*   @return string (Male || Female)    
	*/
	public function setGenderAttribute( $gender ){		
		
		if( $gender === 'Male' )
		{
			return $this->attributes['gender'] = 0;
		} 
		elseif( $gender === 'Female' )
		{
			return $this->attributes['gender'] = 1;
		} 
		// This is a required field.			
	}


	/** Mutator Field seeking_gender
	*	
	*	@param int ( 0 || 1)
	*   @return string (Male || Female)    
	*/
	public function setSeekingGenderAttribute( $seeking_gender ){		
		
		if( $seeking_gender === 'Male' )
		{
			return $this->attributes['seeking_gender'] = 0;
		} 
		elseif( $seeking_gender === 'Female' )
		{
			return $this->attributes['seeking_gender'] = 1;
		} 
		// This is a required field.			
	}
   
}
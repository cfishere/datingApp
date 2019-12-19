<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
//use Laravel\Scout\Searchable;
use Carbon\Carbon;
use Illuminate\Support\Str;


class DatingProfile extends Model
{
	//use Searchable;	

	protected $fillable = [
		'dob','state','country','city','postalcode','gender','seeking_gender','seeking_desc','interests','values', 'gallery', 'likes','matches','favorites','appearance','bio',
	];
	//protected $cast = ['gallery'=>'array'];

	//allow a custom attribute for convenience method to get name+lname
	protected $appends = ['fullname'];
	

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


	public function tag()
	{
		return $this->belongsToMany(Tag::class, 'dating_profile_tag', 'dating_profile_id', 'tag_id' );
	}


	public function user()
	{
		return $this->belongsTo('App\User');
	}


	public function state()
	{
		return $this->belongsTo('App\State');
	}
	

	/**
	 * Get the user's full name.
	 *
	 * @return string
	 */
	public function getFullnameAttribute( )
	{
		return "{$this->user->name} {$this->user->lname}";
	}
	
	
	/** 
	 * 
	 * @param string $gender ('transform gender attrib from str to int')
	 * @return Model Collection
	 */
	public function profilesByGender( $gender )
	{			
		$seekingType = ( strtolower( substr($gender,0,1) ) === 'f' ? 0 : 1 );		
		return $this::with('user')->where( 'gender', '=', $seekingType )->paginate(10)->all();		
	}


	/* Mutator date to timestamp for storage */
	public function setDobAttribute($dob){
		//$date = Carbon::parse($dob);
		return $this->attributes['dob'] = Carbon::parse($dob)->format('Y-m-d');
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
			return $this->attributes['seeking_gender'] = 'Male';
		} 
		elseif( $seeking_gender === 1 )
		{
			return $this->attributes['seeking_gender'] = 'Female';
		} 
		//if null
		return $this->attributes['seeking_gender'] = 'Unknown';				
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


	/** 
	*	Mutator Field gender
	*	@param int ( 0 || 1)
	*   @return string (Male || Female)    
	*/
	public function setGenderAttribute( $gender ){		
		
		if( strtolower(str::limit($gender, 1)) === 'm' )
		{
			return $this->attributes['gender'] = 0;
		} 
		else
		{
			return $this->attributes['gender'] = 1;
		} 
		// This is a required field.			
	}


	/** 
	*	Mutator Field seeking_gender
	*	@param int ( 0 || 1)
	*   @return string (Male || Female)    
	*/
	public function setSeekingGenderAttribute( $seeking_gender ){		
		
		if( strtolower(str::limit($seeking_gender)) === 'm' )
		{
			return $this->attributes['seeking_gender'] = 0;
		} 
		else
		{
			return $this->attributes['seeking_gender'] = 1;
		} 
		// This is a required field.			
	}


	/**
	 * Gallery Field Mutator
	 * @param array
	 *
	 * @return str JSON
	 */
	public function setGalleryAttribute($gallery){	
		 $properties = [];

	    foreach ($gallery as $array_item) {
	        if (!is_null($array_item['key'])) {
	            $properties[] = $array_item;
	        }
	    }

    	$this->attributes['gallery'] = json_encode($properties);

	}


	/**
	 * Relies on pivot table 'dating_profile_tag' 
	 * @param  int $id. id of record in tags table.
	 * @return Collection of Profiles sharing tags.id
	 
	public function getProfilesByTag($id)
	{
		 $this->with('datingprofiles')->where('id', '=', $id)->get();

	}
*/

	/**
	 * Gallery Field Accessor
	 * @param str JSON
	 *
	 * @return array
	 */
	public function getGalleryAttribute($gallery)
	{
		return json_decode($gallery, true);
	}
   
}
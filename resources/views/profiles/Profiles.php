<?php 
namespace App\Http\Profiles;

abstract class Profile
{

	protected function buildViewData()
	{

	}

	protected function loadView()
	{
		return $this->view()->with( $this->buildViewData('profiles') );
	}

}
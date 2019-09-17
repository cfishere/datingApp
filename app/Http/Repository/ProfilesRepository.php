<?php

namespace App\Http\Repository;
/**
* Profile Repository class
*/
class ProfilesRepository
{
    /**
     * Get a list of all profiles
     *
     * @return array  Array containing list of all profiles
     */
    public $profilesList = [];

    public function getProfilesList()
    {
        return [
            [   'id' => 1.
                'user_id' => 1,
                'dob' => '1999-10-20',
                'state', => 17
                'city' => 'Columbus'
                'country' => 1,
                'gender', => 0
                'seeking_gender' => 1
            ],
            [   'id' => 2.
                'user_id' => 2,
                'dob' => '1978-9-10',
                'state', => 12
                'city' => 'Norfolk'
                'country' => 1,
                'gender', => 1
                'seeking_gender' => 0
            ],
        ];
    }
}
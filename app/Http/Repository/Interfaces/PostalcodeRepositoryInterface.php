<?php

namespace App\Http\Repository\Interfaces;

use App\DatingProfile;

interface PostalcodeRepositoryInterface
{
    public function all();

    public function getAllWithinRadius( Model $model, integer $miles );
}
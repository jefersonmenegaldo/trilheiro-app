<?php

namespace App\Repositories;

use App\Interfaces\ICityRepository;
use App\Models\City;

class CityRepository extends BaseRepository implements ICityRepository
{
    public function __construct(City $city)
    {
        parent::__construct($city);
    }

}

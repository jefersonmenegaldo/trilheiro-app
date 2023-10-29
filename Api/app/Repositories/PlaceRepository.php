<?php

namespace App\Repositories;

use App\Interfaces\IPlaceRepository;
use App\Models\Place;

class PlaceRepository extends BaseRepository implements IPlaceRepository
{
    public function __construct(Place $place)
    {
        parent::__construct($place);
    }

}

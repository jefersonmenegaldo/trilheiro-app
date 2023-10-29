<?php

namespace App\Repositories;

use App\Interfaces\ICountryRepository;
use App\Models\Country;

class CountryRepository extends BaseRepository implements ICountryRepository
{
    public function __construct(Country $country)
    {
        parent::__construct($country);
    }

}

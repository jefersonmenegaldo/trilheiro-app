<?php

namespace App\Repositories;

use App\Interfaces\IStateRepository;
use App\Models\State;

class StateRepository extends BaseRepository implements IStateRepository
{
    public function __construct(State $state)
    {
        parent::__construct($state);
    }

}

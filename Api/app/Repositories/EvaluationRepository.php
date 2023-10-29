<?php

namespace App\Repositories;

use App\Interfaces\IEvaluationRepository;
use App\Models\Evaluation;

class EvaluationRepository extends BaseRepository implements IEvaluationRepository
{
    public function __construct(Evaluation $evaluation)
    {
        parent::__construct($evaluation);
    }

}

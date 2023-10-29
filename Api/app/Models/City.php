<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use App\Models\State;

class City extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'acronym',
        'state_id',
    ];

    protected $table = 'cities';

    public function state(): HasOne
    {
        return $this->hasOne(State::class, 'id');
    }
}

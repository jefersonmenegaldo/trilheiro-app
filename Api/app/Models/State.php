<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use App\Models\Country;

class State extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'acronym',
        'country_id',
    ];

    protected $table = 'states';

    public function country(): HasOne
    {
        return $this->hasOne(Country::class, 'id');
    }
}

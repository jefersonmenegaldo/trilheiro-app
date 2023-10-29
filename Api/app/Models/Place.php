<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use App\Models\City;
use App\Models\User;


class Place extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'latitude',
        'longitude',
        'street',
        'neighborhood',
        'number',
        'complement',
        'city_id',
        'user_id'
    ];

    protected $table = 'places';

    public function city(): HasOne
    {
        return $this->hasOne(City::class, 'id');
    }

    public function user(): HasOne
    {
        return $this->hasOne(User::class, 'id');
    }
}

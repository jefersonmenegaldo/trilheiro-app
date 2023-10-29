<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use App\Models\Place;
use App\Models\User;

class Evaluation extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'evaluation',
        'comment',
        'note',
        'place_id',
        'user_id'
    ];

    protected $table = 'evaluations';

    public function user(): HasOne
    {
        return $this->hasOne(User::class, 'id');
    }

    public function place(): HasOne
    {
        return $this->hasOne(Place::class, 'id');
    }
}

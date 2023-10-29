<?php

namespace App\Repositories;

use App\Interfaces\IUserRepository;
use App\Models\User;

class UserRepository extends BaseRepository implements IUserRepository
{
    public function __construct(User $user)
    {
        parent::__construct($user);
    }

}

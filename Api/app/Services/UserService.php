<?php

namespace App\Services;

use App\Repositories\UserRepository;

class UserService
{
    public function __construct(private UserRepository $userRepository)
    {
        $this->userRepository = $userRepository;
    }

    public function getAll()
    {
        return $this->userRepository->getAll();
    }

    public function createUser(array $data)
    {
        return $this->userRepository->create($data);
    }

    public function getUserById(int $id)
    {
        return $this->userRepository->getById($id);
    }

    public function getUser($condition)
    {
        return $this->userRepository->get($condition);
    }

    public function updateUser(int $id, array $data)
    {
        $user = $this->userRepository->getById($id);

        if (!$user) {
            return response()->json(['message' => 'User Not Found'], 404);
        }
        $data = $this->userRepository->update($user->id, $data);

        return response()->json([
            'message' => 'User Updated',
            'data' => $data
        ], 200);
    }

    public function destroyUser(int $id)
    {
        $user = $this->userRepository->getById($id);
        $this->userRepository->delete($id);

        return response()->json(['message' => 'User Deleted'], 200);
    }
}

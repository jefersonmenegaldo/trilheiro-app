<?php

namespace App\Services;

use App\Repositories\StateRepository;

class StateService
{
    public function __construct(private StateRepository $stateRepository)
    {
        $this->stateRepository = $stateRepository;
    }

    public function getAll()
    {
        return $this->stateRepository->getAll();
    }

    public function createState(array $data)
    {
        return $this->stateRepository->create($data);
    }

    public function getStateById(int $id)
    {
        return $this->stateRepository->getById($id);
    }

    public function updateState(int $id, array $data)
    {
        $state = $this->stateRepository->getById($id);

        if (!$state) {
            return response()->json(['message' => 'State Not Found'], 404);
        }
        $data = $this->stateRepository->update($state->id, $data);

        return response()->json([
            'message' => 'State Updated',
            'data' => $data
        ], 200);
    }

    public function destroyState(int $id)
    {
        $state = $this->stateRepository->getById($id);
        $this->stateRepository->delete($id);

        return response()->json(['message' => 'State Deleted'], 200);
    }
}

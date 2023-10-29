<?php

namespace App\Services;

use App\Repositories\CityRepository;

class CityService
{
    public function __construct(private CityRepository $cityRepository)
    {
        $this->cityRepository = $cityRepository;
    }

    public function getAll()
    {
        return $this->cityRepository->getAll();
    }

    public function createCity(array $data)
    {
        return $this->cityRepository->create($data);
    }

    public function getCityById(int $id)
    {
        return $this->cityRepository->getById($id);
    }

    public function updateCity(int $id, array $data)
    {
        $city = $this->cityRepository->getById($id);

        if (!$city) {
            return response()->json(['message' => 'City Not Found'], 404);
        }
        $data = $this->cityRepository->update($city->id, $data);

        return response()->json([
            'message' => 'City Updated',
            'data' => $data
        ], 200);
    }

    public function destroyCity(int $id)
    {
        $city = $this->cityRepository->getById($id);
        $this->cityRepository->delete($id);

        return response()->json(['message' => 'City Deleted'], 200);
    }
}

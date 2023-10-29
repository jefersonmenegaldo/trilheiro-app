<?php

namespace App\Services;

use App\Repositories\PlaceRepository;

class PlaceService
{
    public function __construct(private PlaceRepository $placeRepository)
    {
        $this->placeRepository = $placeRepository;
    }

    public function getAll()
    {
        return $this->placeRepository->getAll();
    }

    public function createPlace(array $data)
    {
        return $this->placeRepository->create($data);
    }

    public function getPlaceById(int $id)
    {
        return $this->placeRepository->getById($id);
    }

    public function updatePlace(int $id, array $data)
    {
        $place = $this->placeRepository->getById($id);

        if (!$place) {
            return response()->json(['message' => 'Place Not Found'], 404);
        }
        $data = $this->placeRepository->update($place->id, $data);

        return response()->json([
            'message' => 'Place Updated',
            'data' => $data
        ], 200);
    }

    public function destroyPlace(int $id)
    {
        $place = $this->placeRepository->getById($id);
        $this->placeRepository->delete($id);

        return response()->json(['message' => 'Place Deleted'], 200);
    }
}

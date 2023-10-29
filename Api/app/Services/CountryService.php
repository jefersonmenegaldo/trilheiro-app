<?php

namespace App\Services;

use App\Repositories\CountryRepository;

class CountryService
{
    public function __construct(private CountryRepository $countryRepository)
    {
        $this->countryRepository = $countryRepository;
    }

    public function getAll()
    {
        return $this->countryRepository->getAll();
    }

    public function createCountry(array $data)
    {
        return $this->countryRepository->create($data);
    }

    public function getCountryById(int $id)
    {
        return $this->countryRepository->getById($id);
    }

    public function updateCountry(int $id, array $data)
    {
        $country = $this->countryRepository->getById($id);

        if (!$country) {
            return response()->json(['message' => 'Country Not Found'], 404);
        }
        $data = $this->countryRepository->update($country->id, $data);

        return response()->json([
            'message' => 'Country Updated',
            'data' => $data
        ], 200);
    }

    public function destroyCountry(int $id)
    {
        $country = $this->countryRepository->getById($id);
        $this->countryRepository->delete($id);

        return response()->json(['message' => 'Country Deleted'], 200);
    }
}

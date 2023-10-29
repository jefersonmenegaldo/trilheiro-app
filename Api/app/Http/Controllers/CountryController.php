<?php

namespace App\Http\Controllers;

use App\Services\CountryService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;

class CountryController extends Controller
{
    private $countryService;

    public function __construct(CountryService $countryService)
    {
        $this->countryService = $countryService;
    }

    public function index(): JsonResponse
    {
        return response()->json([$this->countryService->getAll()]);
    }

    public function store(Request $request): JsonResponse
    {
        $countryDetails = $request->only([

        ]);

        return response()->json([
                $this->countryService->createCountry($countryDetails)
            ],
            Response::HTTP_CREATED
        );
    }

    public function show(Request $request): JsonResponse
    {
        $countryId = $request->route('id');

        return response()->json([
            $this->countryService->getCountryById($countryId)
        ]);
    }

    public function update(Request $request): JsonResponse
    {
        $countryId = $request->route('id');
        $countryDetails = $request->only([

        ]);

        return response()->json([
            $this->countryService->updateCountry($countryId, $countryDetails)
        ]);
    }

    public function destroy(Request $request): JsonResponse
    {
        $countryId = $request->route('id');
        $this->countryService->destroyCountry($countryId);

        return response()->json(null, Response::HTTP_NO_CONTENT);
    }
}

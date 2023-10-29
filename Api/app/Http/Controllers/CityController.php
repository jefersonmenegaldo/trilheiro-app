<?php

namespace App\Http\Controllers;

use App\Services\CityService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;

class CityController extends Controller
{
    private $cityService;

    public function __construct(CityService $cityService)
    {
        $this->cityService = $cityService;
    }

    public function index(): JsonResponse
    {
        return response()->json([$this->cityService->getAll()]);
    }

    public function store(Request $request): JsonResponse
    {
        $cityDetails = $request->only([

        ]);

        return response()->json([
                $this->cityService->createCity($cityDetails)
            ],
            Response::HTTP_CREATED
        );
    }

    public function show(Request $request): JsonResponse
    {
        $cityId = $request->route('id');

        return response()->json([
            $this->cityService->getCityById($cityId)
        ]);
    }

    public function update(Request $request): JsonResponse
    {
        $cityId = $request->route('id');
        $cityDetails = $request->only([

        ]);

        return response()->json([
            $this->cityService->updateCity($cityId, $cityDetails)
        ]);
    }

    public function destroy(Request $request): JsonResponse
    {
        $cityId = $request->route('id');
        $this->cityService->destroyCity($cityId);

        return response()->json(null, Response::HTTP_NO_CONTENT);
    }
}

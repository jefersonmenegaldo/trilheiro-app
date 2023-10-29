<?php

namespace App\Http\Controllers;

use App\Services\PlaceService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;

class PlaceController extends Controller
{
    private $placeService;

    public function __construct(PlaceService $placeService)
    {
        $this->placeService = $placeService;
    }

    public function index(): JsonResponse
    {
        return response()->json([$this->placeService->getAll()]);
    }

    public function store(Request $request): JsonResponse
    {
        $placeDetails = $request->only([

        ]);

        return response()->json([
                $this->placeService->createPlace($placeDetails)
            ],
            Response::HTTP_CREATED
        );
    }

    public function show(Request $request): JsonResponse
    {
        $placeId = $request->route('id');

        return response()->json([
            $this->placeService->getPlaceById($placeId)
        ]);
    }

    public function update(Request $request): JsonResponse
    {
        $placeId = $request->route('id');
        $placeDetails = $request->only([

        ]);

        return response()->json([
            $this->placeService->updatePlace($placeId, $placeDetails)
        ]);
    }

    public function destroy(Request $request): JsonResponse
    {
        $placeId = $request->route('id');
        $this->placeService->destroyPlace($placeId);

        return response()->json(null, Response::HTTP_NO_CONTENT);
    }
}

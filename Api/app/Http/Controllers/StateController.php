<?php

namespace App\Http\Controllers;

use App\Services\StateService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;

class StateController extends Controller
{
    private $stateService;

    public function __construct(StateService $stateService)
    {
        $this->stateService = $stateService;
    }

    public function index(): JsonResponse
    {
        return response()->json([$this->stateService->getAll()]);
    }

    public function store(Request $request): JsonResponse
    {
        $stateDetails = $request->only([

        ]);

        return response()->json([
                $this->stateService->createState($stateDetails)
            ],
            Response::HTTP_CREATED
        );
    }

    public function show(Request $request): JsonResponse
    {
        $stateId = $request->route('id');

        return response()->json([
            $this->stateService->getStateById($stateId)
        ]);
    }

    public function update(Request $request): JsonResponse
    {
        $stateId = $request->route('id');
        $stateDetails = $request->only([

        ]);

        return response()->json([
            $this->stateService->updateState($stateId, $stateDetails)
        ]);
    }

    public function destroy(Request $request): JsonResponse
    {
        $stateId = $request->route('id');
        $this->stateService->destroyState($stateId);

        return response()->json(null, Response::HTTP_NO_CONTENT);
    }
}

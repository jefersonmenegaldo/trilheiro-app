<?php

namespace App\Http\Controllers;

use App\Services\EvaluationService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;

class EvaluationController extends Controller
{
    private $evaluationService;

    public function __construct(EvaluationService $evaluationService)
    {
        $this->evaluationService = $evaluationService;
    }

    public function index(): JsonResponse
    {
        return response()->json([$this->evaluationService->getAll()]);
    }

    public function store(Request $request): JsonResponse
    {
        $evaluationDetails = $request->only([

        ]);

        return response()->json([
                $this->evaluationService->createEvaluation($evaluationDetails)
            ],
            Response::HTTP_CREATED
        );
    }

    public function show(Request $request): JsonResponse
    {
        $evaluationId = $request->route('id');

        return response()->json([
            $this->evaluationService->getEvaluationById($evaluationId)
        ]);
    }

    public function update(Request $request): JsonResponse
    {
        $evaluationId = $request->route('id');
        $evaluationDetails = $request->only([

        ]);

        return response()->json([
            $this->evaluationService->updateEvaluation($evaluationId, $evaluationDetails)
        ]);
    }

    public function destroy(Request $request): JsonResponse
    {
        $evaluationId = $request->route('id');
        $this->evaluationService->destroyEvaluation($evaluationId);

        return response()->json(null, Response::HTTP_NO_CONTENT);
    }
}

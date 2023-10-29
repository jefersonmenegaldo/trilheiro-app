<?php

namespace App\Services;

use App\Repositories\EvaluationRepository;

class EvaluationService
{
    public function __construct(private EvaluationRepository $evaluationRepository)
    {
        $this->evaluationRepository = $evaluationRepository;
    }

    public function getAll()
    {
        return $this->evaluationRepository->getAll();
    }

    public function createEvaluation(array $data)
    {
        return $this->evaluationRepository->create($data);
    }

    public function getEvaluationById(int $id)
    {
        return $this->evaluationRepository->getById($id);
    }

    public function updateEvaluation(int $id, array $data)
    {
        $evaluation = $this->evaluationRepository->getById($id);

        if (!$evaluation) {
            return response()->json(['message' => 'Evaluation Not Found'], 404);
        }
        $data = $this->evaluationRepository->update($evaluation->id, $data);

        return response()->json([
            'message' => 'Evaluation Updated',
            'data' => $data
        ], 200);
    }

    public function destroyEvaluation(int $id)
    {
        $evaluation = $this->evaluationRepository->getById($id);
        $this->evaluationRepository->delete($id);

        return response()->json(['message' => 'Evaluation Deleted'], 200);
    }
}

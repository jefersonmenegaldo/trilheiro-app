<?php

namespace App\Http\Controllers;

use App\Services\UserService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    private $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    public function index(): JsonResponse
    {
        return response()->json([$this->userService->getAll()]);
    }

    public function store(Request $request): JsonResponse
    {
        return response()->json([
                $this->userService->createUser($userDetails)
            ],
            Response::HTTP_CREATED
        );
    }

    public function show(Request $request): JsonResponse
    {
        $userId = $request->route('id');

        return response()->json([
            $this->userService->getUserById($userId)
        ]);
    }

    public function update(Request $request): JsonResponse
    {
        $userId = $request->route('id');
        $userDetails = $request->only([

        ]);

        return response()->json([
            $this->userService->updateUser($userId, $userDetails)
        ]);
    }

    public function destroy(Request $request): JsonResponse
    {
        $userId = $request->route('id');
        $this->userService->destroyUser($userId);

        return response()->json(null, Response::HTTP_NO_CONTENT);
    }
}

<?php

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PlaceController;
use App\Http\Controllers\EvaluationController;
use App\Http\Controllers\CountryController;
use App\Http\Controllers\CityController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\StateController;
use App\Http\Controllers\SessionController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::resource('/session', SessionController::class);
Route::resource('/user', UserController::class)->middleware('auth:sanctum');
Route::resource('/place', PlaceController::class)->middleware('auth:sanctum');
Route::resource('/evaluation', EvaluationController::class)->middleware('auth:sanctum');
Route::resource('/country', CountryController::class)->middleware('auth:sanctum');
Route::resource('/city', CityController::class)->middleware('auth:sanctum');
Route::resource('/state', StateController::class)->middleware('auth:sanctum');

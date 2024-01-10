<?php

use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\AdminAuthController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

// test route
Route::get('message', function(){
    return response()->json([
        'message' => "Hello Laravel Api"
    ], 422);
});

// Route::get('categories', [CategoryController::class, 'index']);
// Route::post('categories/store', [CategoryController::class, 'store']);

Route::apiResource('categories', CategoryController::class);

// Admin routes
Route::post('/admin/login', [AdminAuthController::class, 'login']);
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/admin/create-product', [AdminAuthController::class, 'createProduct']);
    // Route::post('/user/add-to-cart', [UserController::class, 'addToCart']);
});

// User routes
Route::post('/user/login', [UserController::class, 'login']);
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/user/add-to-cart', [UserController::class, 'addToCart']);
    
});
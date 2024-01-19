<?php

use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\AdminAuthController;
use App\Http\Controllers\Api\OrderController;
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


// Admin routes
Route::post('/admin/login', [AdminAuthController::class, 'login']);
Route::group(['prefix' => 'admin','middleware' => 'auth:sanctum',], function () {
    // Route::post('/admin/create-product', [AdminAuthController::class, 'createProduct']);
    // Route::get('categories', [CategoryController::class, 'index']);
    // Route::post('categories/store', [CategoryController::class, 'store']);
    Route::apiResource('categories', CategoryController::class);
    Route::get('/product-list', [ProductController::class, 'index']);
    Route::post('/product-create', [ProductController::class, 'create']);
    Route::post('/product-update/{id}', [ProductController::class, 'update']);
    Route::delete('/delete/{id}', [ProductController::class, 'destroy']);
});

// User routes
Route::post('/user/login', [UserController::class, 'login']);
Route::post('/user/register', [UserController::class, 'create']);
Route::get('/product-list', [UserController::class, 'index']);
Route::group(['prefix' => 'user','middleware' => 'auth:sanctum',], function () {
    Route::get('/cart/list', [UserController::class, 'cartList']);
    Route::post('/add-to-cart', [UserController::class, 'addToCart']);
    Route::post('/place-order', [OrderController::class, 'placeOrder']);
});
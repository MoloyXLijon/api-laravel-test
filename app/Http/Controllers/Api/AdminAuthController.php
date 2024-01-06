<?php

namespace App\Http\Controllers\Api;

use App\Models\Admin;
use App\Models\Product;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class AdminAuthController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (Auth::guard('admin')->attempt($credentials)) {
            $admin = Auth::guard('admin')->user();
            $token = $admin->createToken('AdminToken')->plainTextToken;

            return response()->json([
                'token' => $token,
                'message' => 'Admin Login Successfully'
            ], 200);
        }

        return response()->json(['error' => 'Invalid credentials'], 401);
    }


    public function createProduct(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'category_id' => 'required|integer',
            'price' => 'required',
            'sale_price' => 'nullable|numeric',
            'quantity' => 'required|integer',
        ]);

        $slug = Str::slug($request->input('slug'));

        $product = Product::create([
            'name' => $request->input('name'),
            'slug' => $slug,
            'category_id' => $request->input('category_id'),
            'price' => $request->input('price'),
            'sale_price' => $request->input('sale_price'),
            'quantity' => $request->input('quantity'),
            'status' => $request->input('status'),
        ]);

        return response()->json(['message' => 'Product created successfully', 'product' => $product], 201);
    }
}

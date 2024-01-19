<?php

namespace App\Http\Controllers\Api;

use App\Models\Admin;
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
                'status' => true,
                'token' => $token,
                'message' => 'Admin Login Successfully'
            ], 200);
        }

        return response()->json(['error' => 'Invalid credentials'], 401);
    }

}

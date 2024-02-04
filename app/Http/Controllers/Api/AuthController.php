<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = auth()->user();
            
            if ($user->type == 'admin') {
                $token = $user->createToken('authToken')->plainTextToken;
                return response()->json([
                    'token' => $token,
                    'message' => 'Admin Login Successfully'
                ], 200);
            } else {
                $token = $user->createToken('authToken')->plainTextToken;
                return response()->json([
                    'token' => $token,
                    'message' => 'User Login Successfully'
                ], 200);
            }
        } else {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
    }


    // public function login(Request $request)
    // {
    //     $credentials = $request->only('email', 'password');

    //     if (Auth::guard('admin')->attempt($credentials)) {
    //         $admin = Auth::guard('admin')->user();
    //         $token = $admin->createToken('AdminToken')->plainTextToken;

    //         return response()->json([
    //             'status' => true,
    //             'token' => $token,
    //             'message' => 'Admin Login Successfully'
    //         ], 200);
    //     }

    //     return response()->json(['error' => 'Invalid credentials'], 401);
    // }


    public function create(Request $request)
    {
        try {
            $validateUser = Validator::make($request->all(), 
            [
                'name' => 'required',
                'email' => 'required|email|unique:users,email',
                'password' => 'required'
            ]);

            if($validateUser->fails()){
                return response()->json([
                    'status' => false,
                    'message' => 'validation error',
                    'errors' => $validateUser->errors()
                ], 401);
            }

            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password)
            ]);

            return response()->json([
                'status' => true,
                'message' => 'User Created Successfully',
                'token' => $user->createToken("API TOKEN")->plainTextToken
            ], 200);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }
}

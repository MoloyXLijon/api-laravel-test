<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\CartItem;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Product;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function index()
    {
        $products = Product::with('multi_imgs')->latest()->paginate(20);

        return response()->json([
            'success' => true,
            'message' => 'Successfully retrieved products',
            'data' => $products
        ]);
    }

    public function login_error(){
        return response()->json(['error' => 'Unauthenticated. Please log in.'], 401);
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            $token = $user->createToken('UserToken')->plainTextToken;

            return response()->json([
                'status' => true,
                'message' => 'User login Successfully',
                'token' => $token
            ], 200);
        }

        return response()->json(['error' => 'Invalid credentials'], 401);
    }

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

    public function addToCart(Request $request)
    {
        if (auth()->check()) {
            try {
                $validateUser = Validator::make($request->all(), 
                [
                    'product_id' => 'required',
                    'quantity' => 'required|integer',
                ]);
    
                if($validateUser->fails()){
                    return response()->json([
                        'status' => false,
                        'message' => 'validation error',
                        'errors' => $validateUser->errors()
                    ], 401);
                }

                $user = auth()->user();

                $productId = $request->input('product_id');

                $quantity = $request->input('quantity', 1);

                $cartItem = CartItem::where('user_id', $user->id)
                    ->where('product_id', $productId)
                    ->first();

                if ($cartItem) {
                    $cartItem->update(['quantity' => $cartItem->quantity + $quantity]);
                } else {
                    CartItem::create([
                        'user_id' => $user->id,
                        'product_id' => $productId,
                        'quantity' => $quantity,
                    ]);
                }

                return response()->json(['message' => 'Product added to cart successfully'], 200);
            } catch (\Throwable $th) {
                return response()->json([
                    'status' => false,
                    'message' => $th->getMessage()
                ], 500);
            }
        } else {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
    }

    public function cartList()
    {
        $user = auth()->user();
        $cartItems = $user->cart_items; 
        
        return response()->json([
            'success' => true,
            'message' => 'Cart items retrieved successfully',
            'data' => $cartItems,
        ]);
    }
}

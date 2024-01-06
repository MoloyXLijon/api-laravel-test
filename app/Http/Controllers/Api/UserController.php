<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\User;
use App\Models\CartItem;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            $token = $user->createToken('UserToken')->plainTextToken;

            return response()->json(['token' => $token], 200);
        }

        return response()->json(['error' => 'Invalid credentials'], 401);
    }

    public function addToCart(Request $request)
    {
        // $user = auth()->user();

        // // Assuming you have a 'product_id' in the request
        // $productId = $request->input('product_id');

        // // Assuming you have a 'quantity' in the request
        // $quantity = $request->input('quantity', 1);

        // // Check if the product is already in the cart
        // $cartItem = CartItem::where('user_id', $user->id)
        //     ->where('product_id', $productId)
        //     ->first();

        // if ($cartItem) {
        //     // If the product is already in the cart, update the quantity
        //     $cartItem->update(['quantity' => $cartItem->quantity + $quantity]);
        // } else {
        //     // If the product is not in the cart, create a new cart item
        //     CartItem::create([
        //         'user_id' => $user->id,
        //         'product_id' => $productId,
        //         'quantity' => $quantity,
        //     ]);
        // }

        // return response()->json(['message' => 'Product added to cart successfully'], 200);
    }
}

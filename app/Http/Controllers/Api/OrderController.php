<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\CartItem;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    public function placeOrder(Request $request)
    {
        if (auth()->check()) {
            try {
                $validateUser = Validator::make($request->all(), 
                [
                    'phone' => ['required','regex:/(\+){0,1}(88){0,1}01(3|4|5|6|7|8|9)(\d){8}/','min:11','max:15'],
                    'address' => 'required',
                ]);
    
                if($validateUser->fails()){
                    return response()->json([
                        'status' => false,
                        'message' => 'validation error',
                        'errors' => $validateUser->errors()
                    ], 401);
                }
                $user = auth()->user();
                $cartItems = $user->cart_items;

                $totalAmount = $cartItems->sum(function ($cartItem) {
                    return $cartItem->quantity * $cartItem->product->price;
                });
                $invoice_no = rand(10, 99);

                $email = $request->input('email', $user->email);

                $order = Order::create([
                    'user_id' => $user->id,
                    'address' => $request->input('address'),
                    'phone' => $request->input('phone'),
                    'email' => $email,
                    'total_amount' => $totalAmount,
                    'invoice_no' => $invoice_no,
                ]);

                foreach ($cartItems as $cartItem) {
                    OrderItem::create([
                        'order_id' => $order->id,
                        'product_id' => $cartItem->product_id,
                        'product_name' => $cartItem->product->name,
                        'qty' => $cartItem->quantity,
                        'price' => $cartItem->product->price,
                    ]);
                }

                // $user->cart_items->delete();

                return response()->json(['message' => 'Order placed successfully']);
            } catch (\Throwable $th) {
                return response()->json([
                    'status' => false,
                    'message' => $th->getMessage()
                ], 500);
            }
        } else {
            $products = Product::with('multi_imgs')->latest()->paginate(20);

            return response()->json([
                'success' => true,
                'message' => 'Successfully retrieved products',
                'data' => $products,
            ]);
        }
    }
}

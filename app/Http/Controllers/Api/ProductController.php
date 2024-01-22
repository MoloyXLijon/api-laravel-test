<?php

namespace App\Http\Controllers\Api;

use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Models\Product;
use App\Models\ProductMultiImage;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    public function __construct()
    {
        $this->middleware('isAdmin')->only(['create', 'update', 'destroy']);
    }

    public function index()
    {
        $products = Product::with('multi_imgs')->latest()->paginate(20);

        return response()->json([
            'success' => true,
            'message' => 'Sucessfully Products retrieved',
            'data' => $products
        ]);
    }
    public function create(Request $request)
    {   
        if (!Auth::user()->isAdmin()) {
            return response()->json(['error' => 'Permission denied.'], 403);
        }
        try {
            $validateUser = Validator::make($request->all(), 
            [
                'name' => 'required|string',
                'price' => 'required',
                'quantity' => 'required|integer',
                'thumbnail' => 'nullable|image|mimes:jpeg,png,jpg,gif',
                'multi_img.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            ]);

            if($validateUser->fails()){
                return response()->json([
                    'status' => false,
                    'message' => 'validation error',
                    'errors' => $validateUser->errors()
                ], 401);
            }

            $save_url = '';

            if ($request->hasFile('thumbnail')) {
                $thumbnail = $request->file('thumbnail');
                $thumbnailName = 'thumbnail_' . time() . '.' . $thumbnail->getClientOriginalExtension();
                $thumbnail->storeAs('upload/products/thumbnails', $thumbnailName, 'public');
                $save_url = 'upload/products/thumbnails/' . $thumbnailName;
            }

            $product = Product::create([
                'name' => $request->input('name'),
                'price' => $request->input('price'),
                'quantity' => $request->input('quantity'),
                'thumbnail' => $save_url,
                'status' => $request->input('status'),
            ]);

            if ($request->hasFile('multi_img')) {
                foreach ($request->file('multi_img') as $multiImage) {
                    $multiImageName = 'multi_image_' . time() . '.' . $multiImage->getClientOriginalExtension();
                    $multiImage->storeAs('upload/products/multi-image', $multiImageName, 'public');

                    ProductMultiImage::create([
                        'product_id' => $product->id,
                        'photo_name' => 'upload/products/multi-image/' . $multiImageName,
                        'created_at' => Carbon::now(),
                    ]);
                }
            }

            return response()->json([
                'message' => 'Product created successfully',
                'product' => $product
            ], 201);
        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    public function update(Request $request, $id)
    {
        if (!Auth::user()->isAdmin()) {
            return response()->json(['error' => 'Permission denied.'], 403);
        }
        try {
            $validateUser = Validator::make($request->all(), 
            [
                'name' => 'required|string',
                'price' => 'required',
                'quantity' => 'required|integer',
                'thumbnail' => 'nullable|image|mimes:jpeg,png,jpg,gif',
                'multi_img.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            ]);

            if($validateUser->fails()){
                return response()->json([
                    'status' => false,
                    'message' => 'validation error',
                    'errors' => $validateUser->errors()
                ], 401);
            }
        
            $save_url = '';
            
            
            $product = Product::findOrFail($id);

            if ($request->hasFile('thumbnail')) {
                Storage::disk('public')->delete($product->thumbnail);
            }

            if ($request->hasFile('thumbnail')) {
                $thumbnail = $request->file('thumbnail');
                $thumbnailName = 'thumbnail_' . time() . '.' . $thumbnail->getClientOriginalExtension();
                $thumbnail->storeAs('upload/products/thumbnails', $thumbnailName, 'public');
                $save_url = 'upload/products/thumbnails/' . $thumbnailName;
            }
        
            $product->name = $request->input('name');
            $product->price = $request->input('price');
            $product->quantity = $request->input('quantity');
            $product->thumbnail = $save_url;
            $product->status = $request->input('status');
            $product->save();
        
            if ($request->hasFile('multi_img')) {
                foreach ($request->file('multi_img') as $multiImage) {
                    $multiImageName = 'multi_image_' . time() . '.' . $multiImage->getClientOriginalExtension();
                    $multiImage->storeAs('upload/products/multi-image', $multiImageName, 'public');
        
                    ProductMultiImage::updateOrCreate(
                        ['product_id' => $product->id, 'photo_name' => 'upload/products/multi-image/' . $multiImageName],
                        ['created_at' => Carbon::now()]
                    );
                }
            }
        
            return response()->json([
                'message' => 'Product updated successfully',
                'product' => $product
            ], 201);
        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    public function destroy($id)
    {
        if (!Auth::user()->isAdmin()) {
            return response()->json(['error' => 'Permission denied.'], 403);
        }
        try {
            $product = Product::findOrFail($id);

            if ($product->thumbnail) {
                Storage::disk('public')->delete($product->thumbnail);
            }
            $multiImages = ProductMultiImage::where('product_id', $product->id)->get();

            foreach ($multiImages as $multiImage) {
                Storage::disk('public')->delete($multiImage->photo_name);
                $multiImage->delete();
            }

            $product->delete();

            return response()->json([
                'message' => 'Product deleted successfully',
            ], 200);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                // 'message' => $th->getMessage(),
                'error' => 'Invalid product ID',
            ], 404);
        }
    }
    
}

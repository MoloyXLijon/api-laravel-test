<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function multi_imgs()
    {
        return $this->hasMany(ProductMultiImage::class);
    }

    // public function cart_items()
    // {
    //     return $this->hasMany(CartItem::class);
    // }

    public function orders()
    {
        return $this->hasMany(Order::class);
    }
}

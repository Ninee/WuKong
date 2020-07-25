<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderRecord extends Model
{
    protected $fillable = [
        'order_id', 'product_id'
    ];
}

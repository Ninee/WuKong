<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    const TYPE = [
        1 => '销量单',
        2 => 'Review单'
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}

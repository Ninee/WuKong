<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    const  PAY_TYPE = [
        1 => '已付全款',
        2 => '只付货款',
        3 => '未付款'
    ];
}

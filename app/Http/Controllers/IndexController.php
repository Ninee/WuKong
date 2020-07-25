<?php

namespace App\Http\Controllers;

use App\Qrcode;
use Illuminate\Http\Request;

class IndexController extends Controller
{
    public function index($id = 1)
    {
        $app = \EasyWeChat::officialAccount();
        $qrcodes = Qrcode::where('link_id', $id)->get();
        $rand = rand(0, $qrcodes->count()-1);
        return view('index', ['app' => $app, 'qrcode' => $qrcodes[$rand]]);
    }
}

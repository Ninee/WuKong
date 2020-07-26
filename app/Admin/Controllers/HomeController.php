<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Intervention\Image\Facades\Image;

class HomeController extends Controller
{
    public function index(Content $content)
    {
//        return $content
//            ->header('Dashboard')
//            ->description('Description...')
//            ->row(Dashboard::title())
//            ->row(function (Row $row) {
//
//                $row->column(4, function (Column $column) {
//                    $column->append(Dashboard::environment());
//                });
//
//                $row->column(4, function (Column $column) {
//                    $column->append(Dashboard::extensions());
//                });
//
//                $row->column(4, function (Column $column) {
//                    $column->append(Dashboard::dependencies());
//                });
//            });
        return $content->body('欢迎登陆悟空测评内部系统');
    }

    public function card($id)
    {

        $product = Product::find($id);
//        dd(storage_path('app/public/' . $product->main));
        $main = Image::make(storage_path('app/public/' . $product->main));

        $radio = $main->width() / 1500;
        $fontSize = 50 * $radio;

        $main->text('$' . $product->price, 60, 60 * $radio, function($font) use ($fontSize) {
            $font->file(public_path('font/AdobeHeitiStd-Regular.otf'));
            $font->size($fontSize);
            $font->color('#c54f67');
            $font->align('left');
            $font->valign('top');
        });
        $main->text('keyword: ' . $product->keyword, 60, 120 * $radio, function($font) use ($fontSize) {
            $font->file(public_path('font/AdobeHeitiStd-Regular.otf'));
            $font->size($fontSize);
            $font->color('#c54f67');
            $font->align('left');
            $font->valign('top');
        });
        $main->text('shop: ' . $product->shop, 60, 180 * $radio, function($font) use ($fontSize) {
            $font->file(public_path('font/AdobeHeitiStd-Regular.otf'));
            $font->size($fontSize);
            $font->color('#c54f67');
            $font->align('left');
            $font->valign('top');
        });
        $main->text($product->remark, 60, 240 * $radio, function($font) use ($fontSize) {
            $font->file(public_path('font/AdobeHeitiStd-Regular.otf'));
            $font->size($fontSize);
            $font->color('#c54f67');
            $font->align('left');
            $font->valign('top');
        });

        return $main->response('jpg');
    }
}

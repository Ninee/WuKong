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

        $resize = $main->resize(null, 400, function ($constraint) {
            $constraint->aspectRatio();
        });
        $bg = Image::canvas(650, 600, '#ffffff');

        $radio = $main->width() / 1500;

        $fontSize = 26;
        $color = '#000000';

        $bg->insert($resize);
        $bg->text($product->name . '$' . $product->price, 30, 410, function($font) use ($fontSize, $color) {
            $font->file(public_path('font/AdobeHeitiStd-Regular.otf'));
            $font->size($fontSize);
            $font->color($color);
            $font->align('left');
            $font->valign('top');
        });
        $bg->text('Keyword: ' . $product->keyword . ',在第' . $product->keyword_page . '页', 30, 450, function($font) use ($fontSize, $color) {
            $font->file(public_path('font/AdobeHeitiStd-Regular.otf'));
            $font->size($fontSize);
            $font->color($color);
            $font->align('left');
            $font->valign('top');
        });
        $bg->text('Shop: ' . $product->shop, 30, 490, function($font) use ($fontSize, $color) {
            $font->file(public_path('font/AdobeHeitiStd-Regular.otf'));
            $font->size($fontSize);
            $font->color($color);
            $font->align('left');
            $font->valign('top');
        });
        $bg->text($product->remark, 30, 540, function($font) use ($fontSize, $color) {
            $font->file(public_path('font/AdobeHeitiStd-Regular.otf'));
            $font->size($fontSize);
            $font->color($color);
            $font->align('left');
            $font->valign('top');
        });

        return $bg->response('jpg');
    }
}

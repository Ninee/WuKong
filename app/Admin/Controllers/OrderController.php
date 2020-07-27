<?php

namespace App\Admin\Controllers;

use App\Models\Order;
use App\Models\OrderRecord;
use App\Models\Product;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\DB;

class OrderController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '订单';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Order());
        $grid->model()->orderBy('id', 'desc');
        $grid->actions(function ($actions) {
            $actions->disableDelete();
            $actions->disableView();
        });
        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->like('wechat', '微信号');
            $filter->equal('type', '订单类型')->radio([
                ''   => '所有',
                1 => '销量单',
                2 => 'Review单'
            ]);
            $filter->equal('status', '状态')->radio([
                ''   => '所有',
                1 => '进行中',
                2 => '完成'
            ]);
            $filter->between('created_at', '创建时间')->datetime();
        });

        $grid->column('id', __('Id'));
//        $grid->column('user_id', __('User id'));
        $grid->column('product.name', __('产品'));
        $grid->column('product.shop', __('商铺'));
        $grid->column('product.receiver', __('对接人'));
        $grid->column('type', __('订单类型'))->using(Order::TYPE);
        $grid->column('order_sn', __('订单号'));
        $grid->column('nickname', __('微信昵称'));
        $grid->column('wechat', __('微信号'));
        $grid->column('profile', __('个人主页'))->image();
        $grid->column('screenshot', __('订单截图'))->image();
        $grid->column('status', __('状态'))->using([
            1 => '进行中',
            2 => '完成',
        ], '未知')->dot([
            1 => 'warning',
            2 => 'success',
        ], 'success')->width(100);
        $grid->column('created_at', __('创建时间'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Order::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('product_id', __('Product id'));
        $show->field('order_sn', __('Order sn'));
        $show->field('nickname', __('Nickname'));
        $show->field('wechat', __('Wechat'));
        $show->field('profile', __('Profile'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Order());
        $form->hidden('user_id', __('User id'))->value(Admin::user()->id);
        $form->select('product_id', __('产品'))->options(Product::all()->pluck('name', 'id'));
        $form->radio('type', __('订单类型'))->options(Order::TYPE)->default(1);
        $form->text('order_sn', __('订单号'));
        $form->text('nickname', __('微信昵称'));
        $form->text('wechat', __('微信号'));
        $form->image('profile', __('个人主页截图'))->uniqueName();
        $form->image('screenshot', __('订单截图'))->uniqueName();
        $form->radio('status', __('状态'))->options([
            1 => '进行中',
            2 => '完成',
        ])->default(1);
        $form->saved(function (Form $form) {

            $order = $form->model();
            $order_id = $order->id;
            $product_id = $order->product_id;
            DB::beginTransaction();
            try {
                $repeat = OrderRecord::where('order_id', $order_id)->first();
                if ($repeat) {

                } else {
                    OrderRecord::create([
                        'order_id' => $order_id,
                        'product_id' => $product_id
                    ]);
                    $product = Product::find($product_id);
                    if ($order->type == 1) {
                        $product->amount -= 1;
                    }
                    if ($order->type == 2) {
                        $product->review_amount -= 1;
                    }
                    $product->save();
                }
                DB::commit();
            } catch (\Exception $e) {
                DB::rollBack();
            }
        });
        return $form;
    }
}

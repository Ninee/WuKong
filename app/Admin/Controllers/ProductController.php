<?php

namespace App\Admin\Controllers;

use App\Models\Product;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ProductController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '产品';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Product());

        $grid->model()->orderBy('id', 'desc');
        $grid->actions(function ($actions) {
//            $actions->disableDelete();
            $actions->disableView();
            $cardBtn = '<a target="_blank" class="btn btn-default btn-xs" href="' . admin_url('card') . '/' . $actions->getKey() . '"><i class="fa fa-image"></i>生成图片&nbsp;</a>';
            $actions->append($cardBtn);

        });
        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
        });
        $grid->column('id', __('Id'));
        $grid->column('name', __('商品名'))->width(100);
        $grid->column('price', __('价格USD'));
        $grid->column('keyword', __('关键词'));
        $grid->column('asin', __('Asin'));
        $grid->column('shop', __('店铺名'));
        $grid->column('main', __('主图'))->image();
//        $grid->column('share_img', __('分享图'))->image();
        $grid->column('remark', __('备注'));
        $grid->column('operation', __('特殊操作要求'));
        $grid->column('amount', __('销量单数量'))->width(60);
        $grid->column('review_amount', __('Review单数量'))->width(80);
        $grid->column('pay_type', __('付款方式'))->using(Product::PAY_TYPE)->width(80);
        $grid->column('status', __('状态'))->using([
        1 => '正常',
        2 => '冻结',
    ], '未知')->dot([
        1 => 'success',
        2 => 'danger',
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
        $show = new Show(Product::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('keyword', __('Keyword'));
        $show->field('asin', __('Asin'));
        $show->field('shop', __('Shop'));
        $show->field('main', __('Main'));
        $show->field('amount', __('Amount'));
        $show->field('remark', __('Remark'));
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
        $form = new Form(new Product());
        $form->hidden('user_id', __('User id'))->value(Admin::user()->id);
        $form->text('asin', __('Asin'));
        $form->text('name', '商品名');
        $form->text('price', '价格(USD)');
        $form->text('shop', __('店铺名'));
        $form->text('keyword', __('关键词'));
        $form->number('keyword_page', __('关键词所在页数'));
        $form->image('main', __('主图'))->uniqueName();
//        $form->image('share_img', __('分享图'))->uniqueName();
        $form->number('amount', __('销量单'));
        $form->number('review_amount', __('Review单'));
        $form->text('remark', __('备注'));
        $form->textarea('operation', __('特殊操作要求'));
        $form->text('seller', __('商家'));
        $form->text('receiver', __('对接人'));
        $form->radio('pay_type', __('付款方式'))->options(Product::PAY_TYPE)->default(1);
        $form->radio('status', __('状态'))->options([1 => '正常', '2' => '冻结'])->default(1);
        return $form;
    }
}

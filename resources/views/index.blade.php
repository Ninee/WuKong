<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>《万联会商学院》简介</title>
    <script src="https://res.wx.qq.com/open/js/jweixin-1.4.0.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8">
        wx.config(<?php echo $app->jssdk->buildConfig(array('updateAppMessageShareData', 'updateTimelineShareData'), false) ?>);
    </script>
    <style>
        body, img {
            padding: 0;
            margin: 0;
            background: #1B1B33;
        }
        img {
            width: 100%;
            display: block;
            border: none;
        }
        .content {
            text-align: center;
            background: #1B1B33;
        }
        .qrcode {
            margin-top: 20px;
            width: 30%;
            display: inline-block;
        }
        .footer {
            position: fixed;
            bottom: 0;
        }
        .address {
            color: white;
            font-size: 12px;
            padding-bottom: 30px;
        }
    </style>
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?b1accda23cffba43fe09a188fe4cc0bd";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
</head>
<body>
<div class="header">
    {{--<img src="{{ asset('images/header.png') }}" alt="">--}}
    <img src="{{ asset('images/1_01.jpg') }}" alt="">
    <img src="{{ asset('images/1_02.jpg') }}" alt="">
    <img src="{{ asset('images/1_03.jpg') }}" alt="">
    <img src="{{ asset('images/1_04.jpg') }}" alt="">
    <img src="{{ asset('images/1_05.jpg') }}" alt="">
    <img src="{{ asset('images/1_06.jpg') }}" alt="">
    <img src="{{ asset('images/1_07.jpg') }}" alt="">
</div>
<div class="content">
    <img class="qrcode" src="{{ Storage::disk(config('admin.upload.disk'))->url($qrcode->qrcode) }}" alt="">
    <p class="address">Add: 广州市天河区花城大道68号环球都会611</p>
</div>
{{--<div class="footer">--}}
    {{--<img src="{{ asset('images/footer.png') }}" alt="">--}}
{{--</div>--}}
<script>
    wx.ready(function () {   //需在用户可能点击分享按钮前就先调用
        wx.updateAppMessageShareData({
            title: '《万联会商学院》简介', // 分享标题
            desc: '欢迎咨询《万联会商学院》业务。', // 分享描述
            link: location.href, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: 'https://jianshitiyu.oss-cn-shenzhen.aliyuncs.com/wanlianlogo.jpg', // 分享图标
            success: function () {
                // 设置成功
            }
        });
        wx.updateTimelineShareData({
            title: '《万联会商学院》简介', // 分享标题
            link: location.href, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: 'https://jianshitiyu.oss-cn-shenzhen.aliyuncs.com/wanlianlogo.jpg', // 分享图标
            success: function () {
                // 用户点击了分享后执行的回调函数
            }
        });
    });
</script>
</body>
</html>
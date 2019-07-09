<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <script src="layui/layui.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>

<div class="layui-layout layui-layout-admin">
    <div class="layui-header header header-demo" summer>
        <div class="layui-main">
            <a class="logo" href="/">
                <img src="/static/img/logo.jpg" alt="layui" style="border-radius: 50%;width: 32px;height: 32px;float:left;margin-top:10px;">
            </a>
            <h1 class="layui-nav-item" style="height: 50px;width: 500px;float:left;margin-left: 20px;color:#cccccc;font-family:微软雅黑;line-height: 50px;font-size: 20px;">
                个人中心
            </h1>
            <div class="layui-form component" lay-filter="LAY-site-header-component"></div>
            <ul class="layui-nav" style="float: right;">
                <li class="layui-nav-item layui-this">
                    <a href="#">个人中心</a>
                </li>
                <li class="layui-nav-item">
                    <a href="homepage.html">主页<!--  --></a>
                </li>


                <li class="layui-nav-item">
                    <a href="login.html" target="_blank">注销</a>
                </li>

            </ul>
        </div>
    </div>
</div>

</body>
</html>

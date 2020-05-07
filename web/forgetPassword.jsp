<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>忘记密码页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <link rel="icon" type="image/x-icon" href="static/img/logo.jpg"/>
    <link rel="stylesheet" href="static/CSS/register.css">
    <script src="layui/layui.js"></script>
    <script src="static/JS/jquery-1.12.4.js"></script>
    <base target="_self">

</head>


<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header header header-demo" summer>
        <div class="layui-main">
            <a class="logo" href="/">
                <img src="/static/img/logo.jpg" alt="layui" style="border-radius: 50%;width: 32px;height: 32px;float:left;margin-top:10px;">
            </a>
            <h1 class="layui-nav-item" style="height: 50px;width: 500px;float:left;margin-left: 20px;color:#cccccc;font-family:微软雅黑;line-height: 50px;font-size: 20px;">
                咸鱼图书系统找回密码界面
            </h1>
            <div class="layui-form component" lay-filter="LAY-site-header-component"></div>
            <ul class="layui-nav" style="float: right;">
                <li class="layui-nav-item ">
                    <a href="index.jsp">返回登录<!-- <span class="layui-badge-dot"></span> --></a>
                </li>

                <li class="layui-nav-item">
                <a href="register.html" target="_blank">立即注册</a>
                </li>

            </ul>
        </div>
    </div>
</div>

<div class="content">
    <div class="info" >

        <form class="layui-form " action="register.jsp" style="margin-top:30px;padding-top: 30px;">

            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                    <input type="text" name="username" lay-verify="required" lay-reqtext="用户名不能为空" placeholder="请输入用户名" autocomplete="off" class="layui-input" id="username_input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-block">
                    <input type="text" name="telephone" lay-verify="required" lay-reqtext="手机号不能为空" placeholder="请输入手机号" autocomplete="off" class="layui-input" id="phone">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">新密码</label>
                <div class="layui-input-block">
                    <input type="password" name="password" lay-verify="required" lay-reqtext="密码不能为空" placeholder="请输入密码" autocomplete="off" class="layui-input" id="password_input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">确认密码</label>
                <div class="layui-input-block">
                    <input type="password" name="password1" lay-verify="required" lay-reqtext="密码不能为空" placeholder="请输入密码" autocomplete="off" class="layui-input" id="repwd_input">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">验证码</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="confirm" lay-verify="required" lay-reqtext="验证码错误" autocomplete="off" class="layui-input" id="kaptcha_input">
                    </div>
                </div>
                <div class="layui-inline">
                    <button type="button" class="layui-btn" id="getCaptcha">获取验证码</button>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>

        </form>

    </div>
</div>
<script>
    $('#getCaptcha').click(function () {
        checkPhone()
        return false
    });
    function checkPhone(){
        var phone = document.getElementById('phone').value;
        if(!(/^1[3456789]\d{9}$/.test(phone))){
            alert("手机号码有误，请重填");
            return false;
        }
    }
</script>


</body>
</html>
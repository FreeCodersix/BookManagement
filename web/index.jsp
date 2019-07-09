<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <title>请登录！</title>
    <link rel="icon" type="image/x-icon" href="static/img/logo.jpg"/>
    <link rel="stylesheet" href="static/CSS/clear.css">
    <link rel="stylesheet" href="static/CSS/login.css">
    <script src="static/JS/jquery.min.js"></script>
    <script src="static/JS/jquery-1.12.4.js"></script>
</head>
<body>
<%--<div id="div0">
    <div id="div1">
        &lt;%&ndash;<form class="layui-form" action="check.jsp" name="form">&ndash;%&gt;
            <div id="top">
                <div id="username">
                    <span class="span">用户名：</span>
                    <input type="text" name="username" placeholder="请输入用户名" class="layui-input" id="username_input">
                </div>
                <div id="password">
                    <span class="span">密&nbsp;&nbsp;&nbsp;码：</span>
                    <input type="password" name="password" placeholder="请输入密码" class="layui-input" id="password_input">
                </div>

                <div id="kaptcha">
                    <span class="span">验证码：</span>
                    <input type="text" name="code" id="kaptcha_input" placeholder="请输入验证码" class="layui-input">
                    <img title="点击更换" src="Kaptcha.jpg" name="kaptcha" id="kaptcha_img">
                </div>
            </div>
            <div id="bottom">
                <a href="#" id="a_pwd">忘记密码</a><span style="color: #cccccc">|</span><a href="register.html"
                                                                                       id="a_rgt">注册</a>
                <input type="button" value="Login" id="login_btn" onclick="kaptch_check()">
            </div>
        &lt;%&ndash;</form>&ndash;%&gt;
    </div>
</div>
<script>
    $(function () {
        $("#kaptcha_img").click(function () {
            $(this).hide().attr('src', this.src + '?' + new Date().getTime()).fadeIn();
        });
    });

    function login() {

        var $username = $("#username_input").val();
        var $password = $("#password_input").val();
        $.getJSON(
            "util.user_pwd",
            {
                "username": $username,
                "password": $password
            },

            function (result) {
                if (result.msg === "true") {
                    location.href = "homepage.html";
                } else {
                    alert("用户名或密码错误!");
                }
            }
        );
    }

    $("#kaptcha_input").blur(function () {
        kaptch_check();
    });

    function kaptch_check() {
        var $code = $("#kaptcha_input").val();
        $.getJSON(
            "Servlet",
            {"code": $code},
            function (result) {

                if (result.msg === "true") {
                    login();
                } else {
                    alert("验证码错误!");
                    var kaptcha_input = document.getElementById("kaptcha_input");
                    kaptcha_input.value = "";
                    $("#kaptcha_input").style.placeholder = "请输入验证码"

                }
            }
        )}
</script>--%>
<a href="login.html">点我</a>
</body>
</html>
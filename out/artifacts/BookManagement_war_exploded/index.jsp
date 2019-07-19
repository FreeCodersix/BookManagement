<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Insert title here</title>
    <title>请登录！</title>
    <link rel="icon" type="image/x-icon" href="static/img/logo.jpg"/>
    <link rel="stylesheet" href="static/CSS/clear.css">
    <link rel="stylesheet" href="static/CSS/login.css">
    <script src="static/JS/jquery.min.js"></script>
    <script src="static/JS/jquery-1.12.4.js"></script>
    <%--<script src="static/JS/cookie.js"></script>--%>
    <script src="static/JS/jquery.cookie.js"></script>
    <base target="_self">
</head>
<body>
<div id="div0">
    <div id="div1">
        <%--<form class="layui-form" id="loginForm">--%>
        <div id="top">
            <div id="username">
                <span class="span">用户名：</span>
                <input type="text" name="username" placeholder="请输入用户名" class="layui-input" id="username_input"
                       value="">
            </div>
            <div id="password">
                <span class="span">密&nbsp;&nbsp;&nbsp;&nbsp;码：</span>
                <input type="password" name="password" placeholder="请输入密码" class="layui-input" id="password_input"
                       value="" style="width: 190px;">
                <div style="width: 70px;height: 40px;line-height: 40px;text-align: center;display: inline-block"><input type="checkbox" style="width: 15px;height: 15px;cursor: pointer" id="remember" checked="checked" ><span style="font-size: 16px;font-weight:bolder;color:#ccc">记住我</span></div>
            </div>

            <div id="kaptcha">
                <span class="span">验证码：</span>
                <input type="text" name="code" id="kaptcha_input" placeholder="请输入验证码" class="layui-input">
                <img title="点击更换" src="Kaptcha.jpg" name="kaptcha" id="kaptcha_img">
            </div>
        </div>
        <div id="bottom">
            <a href="#" id="a_pwd">忘记密码</a>
            <span style="color: #cccccc">|</span><a href="register.html" id="a_rgt">注册</a>
            <input type="button" value="Login" id="login_btn" onclick="kaptch_check()">
        </div>
        <%--</form>--%>
    </div>
</div>
<script>
    $(function () {
        $("#kaptcha_img").click(function () {
            $(this).hide().attr('src', this.src + '?' + new Date().getTime()).fadeIn();
        });
        var kaptcha_input = document.getElementById("kaptcha_input");
        kaptcha_input.value = "";
        var u_input = document.getElementById("username_input");
        u_input.value = $.getCookie();
        var p_input = document.getElementById("password_input");
        p_input.value = $.getCookie(u_input.value);
    });

    function login() {

        var $username = $("#username_input").val();
        var $password = $("#password_input").val();
        $.getJSON(
            "util.user_pwd",
            {
                "username": $username,
                "password": $password,
                "repassword": ""
            },

            function (result) {
                if (result.msg === "true") {
                    // alert($("input[type='checkbox']").is(':checked'));
                    // 判断选择框是否被选中
                    // $("input[type='checkbox']").is(':checked')
                    if ($("input[type='checkbox']").is(':checked')) {
                        var username_input_val = $("#username_input").val();
                        var password_input_val = $("#password_input").val();
                        $.addCookie(username_input_val, password_input_val, 1);
                        // console.log(document.cookie);
                    } else {
                        var username_input_val1 = $("#username_input").val();
                        $.delCookie(username_input_val1);
                    }
                    location.href = "homePage.jsp?src=book?method=list";
                } else {
                    alert("用户名或密码错误!");
                }
            }
        );
    }

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

                }
            }
        )
    }

    <%session.setAttribute("username",null);%>

    $("#username_input").change(function () {
        var username_input = $("#username_input").val();
        // console.log(username_input);
        if ($.getCookie(username_input) != null && $.getCookie(username_input).length > 0) {
            var password_input = document.getElementById("password_input");
            password_input.value = $.getCookie(username_input);
            // $("#password_input").text(getCookie(username_input));
            console.log($.getCookie(username_input));
        }
    })
</script>

</body>
</html>
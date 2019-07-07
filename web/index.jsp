<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/7
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" href="layui/css/layui.css">
  </head>
  <body>
  <a href="login.html">登录</a>
  <script src="layui/layui.js"></script>
  <script>
      //一般直接写在一个js文件中
      layui.use(['layer', 'form'], function(){
          var layer = layui.layer
              ,form = layui.form;

          layer.msg('Hello World');
      });
  </script>
  </body>
</html>

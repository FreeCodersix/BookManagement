<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/9
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>咸鱼图书</title>
    <script src="layui/layui.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="icon" type="image/x-icon" href="static/img/logo.jpg"/>
    <script src="static/JS/jquery-1.12.4.js"></script>
    <base type="_self">
    <style>
        #iframe {
            width: 88.5%;
            height: 93%;
            position: fixed;
            right: 0;
            top: 60px;
            border: none;
        }
    </style>
</head>

<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header header header-demo" summer>
        <div class="layui-main">
            <a class="logo" href="#">
                <img src="static/img/logo.jpg" alt="layui"
                     style="border-radius: 50%;width: 32px;height: 32px;float:left;margin-top:10px;">
            </a>
            <%
                if (session.getAttribute("username") == null || session.getAttribute("username").toString().length() == 0) {
            %>
            <h1 class="layui-nav-item"
                style="height: 50px;width: 500px;float:left;margin-left: 20px;color:#cccccc;font-family:微软雅黑;line-height: 50px;font-size: 20px;">
                咸鱼图书系统，请<a href="index.jsp" style="font-family: '微软雅黑';font-weight: bolder;color: orangered;"><u>登录</u></a>!
            </h1>
            <%
            } else {%>
            <h1 class="layui-nav-item"
                style="height: 50px;width: 500px;float:left;margin-left: 20px;color:#cccccc;font-family:微软雅黑;line-height: 50px;font-size: 20px;">
                咸鱼图书系统，当前用户： <%=session.getAttribute("username")%>
            </h1><%
            }
        %>
            <div class="layui-form component" lay-filter="LAY-site-header-component"></div>
            <ul class="layui-nav" style="float: right;">
                <li class="layui-nav-item ">
                    <a href="center.jsp">个人中心</a>
                </li>
                <li class="layui-nav-item layui-this">
                    <a href="javascript:;">主页<!--  --></a>
                </li>


                <li class="layui-nav-item">
                    <a href="index.jsp" target="_self">注销</a>
                </li>

            </ul>
        </div>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">

            <ul class="layui-nav layui-nav-tree site-demo-nav">

                <li class="layui-nav-item layui-nav-itemed">
                    <a class="javascript:;" href="javascript:;">书籍查询</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this">
                            <a href="/demo/">书名搜索</a>
                        </dd>
                        <dd>
                            <a href="/demo/">类别搜索</a>
                        </dd>
                        <dd>
                            <a href="/demo/">作者搜索</a>
                        </dd>
                        <dd>
                            <a href="/demo/">出版社搜索</a>
                        </dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-nav-itemed">
                    <a class="javascript:;" href="javascript:;">书籍借阅</a>
                    <dl class="layui-nav-child">
                        <dd class="">
                            <a href="/demo/grid.html">申请借阅</a>
                        </dd>
                        <dd class="">
                            <a href="/demo/admin.html">申请归还</a>
                        </dd>
                        <dd class="">
                            <a href="/demo/admin.html">申请预定</a>
                        </dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-nav-itemed">
                    <a class="javascript:;" href="javascript:;">问题咨询</a>
                    <dl class="layui-nav-child">
                        <dd class="">
                            <a href="homePage.jsp?src=advice.html" class="prr">问题</a>
                        </dd>
                        <dd class="">
                            <a href="homePage.jsp?src=advice.html" class="prr">投诉</a>
                        </dd>
                        <dd>
                            <a href="homePage.jsp?src=advice.html" class="prr">意见和建议</a>
                        </dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-nav-itemed">
                    <p id="p" style="margin-left: 20px;font-weight: bolder;cursor:pointer;">返回</p>
                </li>
            </ul>

        </div>
    </div>
    <iframe id="iframe" src=<%=request.getParameter("src")%>></iframe>
</div>
<div id="LAY_democodejs">
    <script>
        layui.use('element', function () {
            var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

            //监听导航点击
            element.on('nav(demo)', function (elem) {
                //console.log(elem)
                layer.msg(elem.text());
            });
        });

        $(".prr").click(function () {
            $("#iframe").attr("src", "advice.html");
        });
        $("#p").click(function () {
            history.go(-1);
            goBack();
        });

        function goBack() {
            history.go(-1);
        }

    </script>
</div>
</body>

</html>

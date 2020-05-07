<%@ page import="com.mysql.fabric.xmlrpc.base.Data" %><%--
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
            width: 86.5%;
            height: 93%;
            position: fixed;
            left: 200px;
            top: 60px;
            border: none;
        }

        #li,#problem,#problemManeger {
            display: none;
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
                session.setAttribute("u_id", request.getParameter("u_id"));
                session.setAttribute("identify",request.getParameter("identify"));
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
                    <a href="center.jsp?u_id=<%=session.getAttribute("u_id")%>&identify=<%=session.getAttribute("identify")%>"><i
                            class="layui-icon">&#xe770;</i>个人中心</a>
                </li>
                <li class="layui-nav-item layui-this">
                    <a href="javascript:;"><i class="layui-icon">&#xe68e;</i>主页<!--  --></a>
                </li>


                <li class="layui-nav-item">
                    <a href="index.jsp" target="_self"><i class="layui-icon">&#xe65c;</i>注销</a>
                </li>

            </ul>
        </div>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">

            <ul class="layui-nav layui-nav-tree site-demo-nav" id="ul">

                <li class="layui-nav-item layui-nav-itemed">
                    <a class="javascript:;" href="javascript:;">书籍查询</a>
                    <dl class="layui-nav-child">
                        <dd class="nav layui-this" id="nav1">
                            <a class="a" href="" id="bookName">书名搜索</a>
                        </dd>
                        <dd class="nav" id="nav2">
                            <a class="a" href="" id="category">类别搜索</a>
                        </dd>
                        <dd class="nav" id="nav3">
                            <a class="a" href="" id="author">作者搜索</a>
                        </dd>
                        <dd class="nav" id="nav4">
                            <a class="a" href="" id="press">出版社搜索</a>
                        </dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-nav-itemed" id="li">
                    <a class="javascript:;" href="javascript:;">书籍借阅管理</a>
                    <dl class="layui-nav-child">
                        <dd class="nav" id="nav5">
                            <a href="" class="apply" id="apply1">借阅记录</a>
                        </dd>
                        <dd class="nav" id="nav6">
                            <a href="" class="apply" id="apply2">归还记录</a>
                        </dd>
                        <dd class="nav" id="nav7">
                            <a href="" class="apply" id="apply3">归还申请</a>
                        </dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-nav-itemed" id="problem">
                    <a class="javascript:;" href="javascript:;">问题反馈</a>
                    <dl class="layui-nav-child">
                        <dd class="nav" id="nav8">
                            <a href="homePage.jsp?src=advice.jsp" class="advice" id="advice1">问题</a>
                        </dd>
                        <dd class="nav" id="nav9">
                            <a href="homePage.jsp?src=advice.jsp" class="advice" id="advice2">投诉</a>
                        </dd>
                        <dd class="nav" id="nav10">
                            <a href="homePage.jsp?src=advice.jsp" class="advice" id="advice3">意见和建议</a>
                        </dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-nav-itemed" id="problemManeger">
                    <a class="javascript:;" href="javascript:;">问题反馈管理</a>
                    <dl class="layui-nav-child">
                        <dd class="nav" id="nav11">
                            <a href="homePage.jsp?src=advice_admin.jsp&nav_id=advice4&type=问题" class="advice_admin" id="advice4">问题管理</a>
                        </dd>
                        <dd class="nav" id="nav12">
                            <a href="homePage.jsp?src=advice_admin.jsp&nav_id=advice5&type=投诉" class="advice_admin" id="advice5">投诉管理</a>
                        </dd>
                        <dd class="nav" id="nav13">
                            <a href="homePage.jsp?src=advice_admin.jsp&nav_id=advice6&type=意见和建议" class="advice_admin" id="advice6">意见和建议管理</a>
                        </dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-nav-itemed">
                    <p id="p" style="margin-left: 20px;font-weight: bolder;cursor:pointer;">返回</p>
                </li>
            </ul>

        </div>
    </div>

    <iframe id="iframe" width="100%"
            src=<%=request.getParameter("src")+"&identify="+request.getParameter("identify")%> frameborder=0
            allowfullscreen></iframe>
</div>
<div id="LAY_democodejs">
    <script>
        window.onload = function (ev) {
            var identi = "<%=request.getParameter("identify")%>";
            if (identi === "admin") {
                var li = document.getElementById("li");
                li.style.display = "block";
                var problemManeger = document.getElementById("problemManeger");
                problemManeger.style.display = "block";
            }else{
                var problem = document.getElementById("problem");
                problem.style.display = "block";
            }
        };

        $(function () {
            $(".a").click(function () {
                var id = $(this).attr("id");

                $("#iframe").attr('src', "book?method=list&queryId=" + id + "&identify=<%=request.getParameter("identify")+"&u_id"+request.getParameter("u_id")%> ");
            })
        });
        var id;
        var idList = [];
        idList[0] = idList[1] = "nav1";
        var i = 2;

        layui.use('element', function () {
            var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

            //监听导航点击
            element.on('nav(demo)', function (elem) {
                //console.log(elem)
                layer.msg(elem.text());
            });
        });

        $(".advice").click(function () {
            var nav_id = $(this).attr("id");
            $("#iframe").attr("src", "advice.jsp?nav_id=" + nav_id);
        });

        $(".advice_admin").click(function () {
            var nav_id = $(this).attr("id");
            var type;
            if(nav_id === 'advice4'){
                type = '问题'
            }else if(nav_id === 'advice5'){
                type ='投诉'
            }else{
                type = '意见和建议'
            }
            $("#iframe").attr("src", "advice_admin.jsp?nav_id=" + nav_id+"&type="+type);
        });

        $(".apply").click(function () {
            var apply_id = $(this).attr("id");
            var status;
            if(apply_id == 'apply1'){
                status = '借阅'
            }else if(apply_id == 'apply2'){
                status = '归还'
            }else{
                status = '待审核'
            }
            $("#iframe").attr("src", "apply.jsp?apply_id=" + apply_id + "&status=" + status);
        });
        $("#p").click(function () {
            if (i > 2) {
                history.go(-1);
                i--;
                idList[i] = "";
            }
            $(".nav").removeClass("layui-this");
            var idnav = document.getElementById(idList[i - 1]);
            idnav.className = "nav layui-this";
            return false;
        });

        $(".nav").click(function () {
            $(".nav").removeClass("layui-this");
            $(this).addClass("layui-this");
            id = $(this).attr("id");
            idList[i] = id;
            i++;
            return false;
        });
    </script>
</div>
</body>

</html>

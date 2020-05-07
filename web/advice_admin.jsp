
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="util.checkUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--suppress ALL --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>advice</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="icon" type="image/x-icon" href="static/img/logo.jpg"/>
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="static/CSS/register.css">
    <script src="layui/layui.js"></script>
    <script src="static/JS/jquery-1.12.4.js"></script>
</head>
<body>
<div class="layui-main">
    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
        <ul class="layui-tab-title">
            <li class="advice_nav" id="advice4">问题</li>
            <li class="advice_nav" id="advice5">投诉</li>
            <li class="advice_nav" id="advice6">意见和建议</li>
        </ul>
        <div id="div3" class="layui-tab-item layui-show">
            <table class="layui-table" id="feedBack_admin" border="1" style="text-align: center;">
                <tr>
                    <th style="text-align: center;" width="40">序号</th>
                    <th style="text-align: center;" width="60">用户ID</th>
                    <th style="text-align: center;" width="60">反馈类型</th>
                    <th style="text-align: center;" width="140">反馈内容</th>

                </tr>
            </table>
        </div>
    </div>

</div>

<script>
    window.onload = function (ev) {
        $(".advice_nav").removeClass("layui-this");

        let idn_id = "<%=request.getParameter("nav_id")%>";
        var idn = document.getElementById(idn_id);
        idn.className="advice_nav layui-this";
        feedBack_admin()
        return false;
    };

    function feedBack_admin() {
        <%
        session.setAttribute("type",request.getParameter("type"));
        %>
        <%
        List<String> feedBackList = new LinkedList<>();
        try {
        feedBackList = checkUser.queryFeedBack_admin(feedBackList,session.getAttribute("type").toString());

        }catch (Exception e) {
        e.printStackTrace();
        }
        int k2 = 0;
        for(String string : feedBackList) {
            String data[] = string.split(",");
            %>

        var tr = document.createElement('tr');
        tr.class = '.last_tr';
        var tdd = document.createElement('td');
        tdd.innerText = <%=k2%>;
        tr.appendChild(tdd);
        <%
            for (int i = 0; i < 3; i++) {
                %>
        var td = document.createElement('td');
        td.innerText = '<%=data[i]%>';
        tr.append(td);

        $(tr).addClass("addtr");
        $("#feedBack_admin").append(tr);
        <%
        }
          k2++;
        }
        %>

    }
</script>
</body>
</html>
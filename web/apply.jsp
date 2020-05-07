<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="util.checkUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>advice</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="static/CSS/register.css">
    <script src="layui/layui.js"></script>
    <script src="static/JS/jquery-1.12.4.js"></script>
</head>
<body>
<div class="layui-main">
    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
        <ul class="layui-tab-title">
            <li class="apply_nav layui-this" id="apply1">借阅记录</li>
            <li class="apply_nav" id="apply2">归还记录</li>
            <li class="apply_nav" id="apply3">归还申请</li>
        </ul>
        <div class="layui-tab-content" style="height: 100px;">
            <div class="layui-tab-item" id="div_apply1">
                <!-- 内容1 -->
                <table class="layui-table" id="demo_apply1" border="1" style="text-align: center;">
                    <tr>
                        <th style="text-align: center;" width="40">序号</th>
                        <th style="text-align: center;" width="60">用户ID</th>
                        <th style="text-align: center;" width="60">书ID</th>
                        <th style="text-align: center;" width="140">书名</th>
                        <th style="text-align: center;" width="140">借阅时间</th>
                        <th style="text-align: center;" width="140">应归还时间</th>
                        <th style="text-align: center;" width="140">借阅状态</th>
                        <%--<th style="text-align: center;" width="200">操作</th>--%>
                        <%--<th style="text-align: center;display: none;" width="200">id</th>--%>
                    </tr>
                </table>

            </div>

            <div class="layui-tab-item" id="div_apply2">
                <!-- 内容2 -->
                <table class="layui-table" id="demo_apply2" border="1" style="text-align: center;">
                    <tr>
                        <th style="text-align: center;" width="40">序号</th>
                        <th style="text-align: center;" width="60">用户ID</th>
                        <th style="text-align: center;" width="60">书ID</th>
                        <th style="text-align: center;" width="140">书名</th>
                        <th style="text-align: center;" width="140">借阅时间</th>
                        <th style="text-align: center;" width="140">应归还时间</th>
                        <th style="text-align: center;" width="140">借阅状态</th>
                        <%--<th style="text-align: center;" width="200">操作</th>--%>
                        <%--<th style="text-align: center;display: none;" width="200">id</th>--%>
                    </tr>
                </table>

            </div>

            <div class="layui-tab-item" id="div_apply3">
                <!-- 内容3 -->
                <table class="layui-table" id="demo_apply3" border="1" style="text-align: center;">
                    <tr>
                        <th style="text-align: center;" width="40">序号</th>
                        <th style="text-align: center;" width="60">用户ID</th>
                        <th style="text-align: center;" width="60">书ID</th>
                        <th style="text-align: center;" width="140">书名</th>
                        <th style="text-align: center;" width="140">借阅时间</th>
                        <th style="text-align: center;" width="140">应归还时间</th>
                        <th style="text-align: center;" width="140">借阅状态</th>
                        <th style="text-align: center;" width="200">操作</th>
                        <th style="text-align: center;display: none;" width="200">id</th>
                    </tr>
                </table>
            </div>
        </div>
    </div>

</div>

<script>
    window.onload = function (ev) {
        $(".apply_nav").removeClass("layui-this");
        $(".layui-tab-item").removeClass("layui-show");
        var idn = document.getElementById('<%=request.getParameter("apply_id")%>');
        var div = document.getElementById("div_"+'<%=request.getParameter("apply_id")%>');
        idn.className="apply_nav layui-this";
        div.className="layui-tab-item layui-show";
        apply()
        return false;
    };

    $(function () {
        // $("button").click(function (ev) {//获取点击id
        $(document).on('click', 'button', function (ev) {
            ev.preventDefault();
            var sure = false;
            var sid = $(this).attr("id");
            if (sid !== "change" && sid !== "btn_hidden") {
                var id = sid.split("+")[0];
                var btn = document.getElementById(id);
                var state = sid.split("+")[1];
                if (state === "待审核")
                    layui.use('layer', function () {
                        var layer = layui.layer;

                        layer.open(
                            {
                                title: '',
                                content: '是否同意此还书申请？',
                                closeBtn: true,
                                shade: 0.3,
                                move: false,
                                yes: function (index) {
                                    sub(id);
                                    layer.close(index);
                                    setTimeout(function () {
                                        alert("确认还书成功！");
                                        window.location.href = window.location.href
                                    },100)

                                }
                            }
                        );
                    });
                else {
                    alert("您已同意此申请，请勿重复审批!");
                }
            }
        });

    });

    function sub(id) {
        $.getJSON(
            "book?method=returnBooks",
            {
                "rbid": id,
                "state": "归还",
            }
        );
    }

    function apply() {
        <%
        session.setAttribute("status",request.getParameter("status"));
        %>
        <%
        List<String> list = new LinkedList<>();
        try {
        list = checkUser.queryBorrow_admin(list,session.getAttribute("status").toString());
        }catch (Exception e) {
        e.printStackTrace();
        }
        int k = 0;
        for(String string : list) {
            String data[] = string.split(",");
            %>

        var tr = document.createElement('tr');
        tr.class = '.last_tr';
        var tdd = document.createElement('td');
        tdd.innerText = <%=k%>;
        tr.appendChild(tdd);
        <%
            String bid=null;
            for (int i = 0; i < 6; i++) {
                %>
        var td = document.createElement('td');
        td.innerText = '<%=data[i]%>';
        tr.append(td);
        <%
                bid = data[1] + ":" + data[6] + "+" + data[5];
            }
            %>
        if('待审核' === '<%=session.getAttribute("status").toString()%>') {
            var ttdd = document.createElement('td');
            ttdd.innerHTML = "<button class=\"layui-btn\" id=\"<%=bid%>\">同意</button>";
            tr.append(ttdd);
        }
        $(tr).addClass("addtr");
        console.log("steven_apply")
        $("#demo_"+'<%=request.getParameter("apply_id")%>').append(tr);
        <%
          k++;
        }
        %>

    }
</script>
</body>
</html>
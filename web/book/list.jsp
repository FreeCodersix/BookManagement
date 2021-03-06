<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>图书列表</title>
    <link rel="stylesheet" href="../static/CSS/register.css">
    <link rel="stylesheet" href="../layui/css/layui.css" media="all">
    <script src="../layui/layui.js"></script>
    <script src="../static/JS/jquery-1.12.4.js"></script>
    <style>
        .query{
            margin: 0 0 0 20px;
            background: url(../static/img/search.png) no-repeat;
            background-color: white;
            color: #555555;
            background-position: 3px;
            padding-left: 25px;
            border: 1px solid #c9c9c9;
        }

        .query:hover{
            color:#555
        }

        .my_input{
            width: 200px;
        }

        .display-none{
            display: none;
        }
        .display-block{
            display: inline-block;
        }
    </style>
</head>
<body>
<form style="margin-top: 30px;" class="layui-form" action="book" method="post">
    <input type="hidden" name="method" value="list"/><%--param.id也可以--%>
    <input type="hidden" name="identify" value="admin"/>

    <div class="layui-form-item">
        <div id="bookName" class="layui-input-inline queryDiv display-block" style="width: 100%;!important;">
            <label class="layui-form-label" style="width: 200px; float: left;">当前查询方式为：按书名查询</label>
            <input type="text" name="b_name" placeholder="书名查询" autocomplete="off" class="layui-input isEmpty my_input"  style="float: left">
            <input class="layui-btn query" type="submit" value='查询' name="b_id"  style="float: left">

            <button type="reset" class="layui-btn layui-btn-primary" style="float: left" ><i class="layui-icon">&#xe669;</i>重置</button>
        </div>

        <div id="category" class="layui-input-inline queryDiv display-none" style="width: 100%;!important;">
            <label class="layui-form-label" style="width: 200px; float: left;">当前查询方式为：按类别查询</label>
            <input type="text" name="b_class" placeholder="类别查询" autocomplete="off" class="layui-input isEmpty my_input"  style="float: left">
            <input class="layui-btn query" type="submit" value='查询' name="b_id"  style="float: left">
            <button type="reset" class="layui-btn layui-btn-primary" style="float: left" ><i class="layui-icon">&#xe669;</i>重置</button>
        </div>
    </div>

    <div class="layui-form-item">

        <div id="author" class="layui-input-inline  queryDiv display-none" style="width: 100%;!important;">
            <label class="layui-form-label" style="width: 200px; float: left;">当前查询方式为：按作者查询</label>
            <input type="text" name="b_author" placeholder="作者查询" autocomplete="off" class="layui-input isEmpty my_input"   style="float: left">
            <input class="layui-btn query" type="submit" value='查询' name="b_id"  style="float: left">
            <button type="reset" class="layui-btn layui-btn-primary" style="float: left" ><i class="layui-icon">&#xe669;</i>重置</button>
        </div>


        <div id="press" class="layui-input-inline queryDiv display-none" style="width: 100%;!important;">
            <label class="layui-form-label" style="width: 200px; float: left;">当前查询方式为：按出版社查询</label>
            <input type="text" name="b_publisher" placeholder="出版社查询" autocomplete="off" class="layui-input isEmpty my_input"  style="float: left">
            <input class="layui-btn query" type="submit" value='查询' name="b_id"  style="float: left">
            <button type="reset" class="layui-btn layui-btn-primary" style="float: left" ><i class="layui-icon">&#xe669;</i>重置</button>
        </div>
    </div>
</form>
<button class="layui-btn" lay-filter="demo1" onclick="location.href='book?method=input'"><i
        class="layui-icon">&#xe654;</i>添加图书
</button>

<table id="table" border="1" style="width: 100% ;height: 100%;text-align: center;">
    <tr>
        <th width="40">序号</th>
        <th width="60">ID</th>
        <th width="140">书名</th>
        <th width="80">类别</th>
        <th width="40">数量</th>
        <th width="160">作者</th>
        <th width="200">出版社</th>
        <th width="100">出版日期</th>
        <th width="200">操作</th>
    </tr>

    <%--@elvariable id="bookList" type="java.util.List"--%>
    <c:forEach var="book" items="${bookList}" varStatus="vs">

        <tr>
            <td>${vs.count}</td>
            <td>${book.b_id}</td>
            <td>${book.b_name}</td>
            <td>${book.b_class}</td>
            <td>${book.b_no}</td>
            <td>${book.b_author}</td>
            <td>${book.b_publisher}</td>
            <td>${book.b_pubDate}</td>

            <td id="op">
                <button class="layui-btn" id="mybtn" lay-filter="demo1"
                        onclick="location.href='book?method=input&b_id=${book.b_id}'"><i class="layui-icon">&#xe642;</i>修改
                </button>
                <button class="layui-btn" id="mybtn1" lay-filter="demo1"
                        onclick="location.href='book?method=delete&b_id=${book.b_id}'"><i
                        class="layui-icon">&#xe640;</i>删除
                </button>
            </td>

        </tr>
    </c:forEach>
</table>

<script>
    $(function () {
        if(null !== <%=request.getParameter("queryId")%>){
            // console.log($(".queryDiv"));
            //移除所有的显示属性
            $(".queryDiv").removeClass("display-block");
            //添加所有的隐藏属性，此时所有查询框都是隐藏的
            $(".queryDiv").addClass("display-none");
            <%--console.log($("#<%=request.getParameter("queryId")%>"));--%>
            //先移除要求显示的框的隐藏属性，再添加显示属性
            $("#<%=request.getParameter("queryId")%>").removeClass("display-none");
            $("#<%=request.getParameter("queryId")%>").addClass("display-block");
        }
        $("#query").click(function () {
            var inputList = document.getElementsByClassName("isEmpty");
            var str = "";
            for (var i = 0; i < 4; i++) {
                str += inputList[i].value;
            }
            console.log(str);
            if (str === null || str.length === 0) {
                alert("查询条件不能为空!");
                return false;
            }
        });
    });
    layui.use('table', function () {
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#table'
            , height: 312
            , url: '/demo/table/user/' //数据接口
            , page: true //开启分页
        });

    });
</script>
</body>
</html>
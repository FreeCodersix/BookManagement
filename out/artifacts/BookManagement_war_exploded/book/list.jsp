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
    <title>公司管理列表</title>
    <link rel="stylesheet" href="../static/CSS/register.css">
    <link rel="stylesheet" href="../layui/css/layui.css" media="all">
    <script src="../layui/layui.js"></script>
    <script src="../static/JS/jquery-1.12.4.js"></script>
</head>
<body>
<form style="margin-top: 30px;" class="layui-form" action="book" method="post">
    <input type="hidden" name="method" value="list"/><%--param.id也可以--%>

    <div class="layui-form-item">

        <label class="layui-form-label">书名</label>
        <div class="layui-input-inline" style="width: 500px;!important;">
            <input type="text" name="b_name" placeholder="书名查询" autocomplete="off" class="layui-input isEmpty">
        </div>

        <label class="layui-form-label">类别</label>
        <div class="layui-input-inline" style="width: 500px;!important;">
            <input type="text" name="b_class" placeholder="类别查询" autocomplete="off" class="layui-input isEmpty">
        </div>
    </div>

    <div class="layui-form-item">

        <label class="layui-form-label">作者</label>
        <div class="layui-input-inline" style="width: 500px;!important;">
            <input type="text" name="b_author" placeholder="作者查询" autocomplete="off" class="layui-input isEmpty">
        </div>

        <label class="layui-form-label">出版社</label>
        <div class="layui-input-inline" style="width: 500px;!important;">
            <input type="text" name="b_publisher" placeholder="出版社查询" autocomplete="off" class="layui-input isEmpty">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <input class="layui-btn" type="submit" value="查询" name="b_id" id="query">
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<button class="layui-btn" lay-filter="demo1" onclick="location.href='book?method=input'">添加图书</button>

<table border="1" style="width: 100% ;height: 100%;text-align: center;">
    <tr>
        <th width="40">序号</th>
        <th width="60">ID</th>
        <th width="140">书名</th>
        <th width="80">类别</th>
        <th width="40">数量</th>
        <th width="160">作者</th>
        <th width="200">出版社</th>
        <th width="100">出版日期</th>
        <%--<th width="550">简介</th>--%>
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
            <%--<td>${book.b_comment}</td>--%>
            <td>
                    <%--<a href="book?method=input&b_id=${book.b_id}">修改</a>--%>
                    <%--<a href="book?method=delete&b_id=${book.b_id}">删除</a>--%>
                        <button class="layui-btn" lay-filter="demo1"
                                onclick="location.href='book?method=input&b_id=${book.b_id}'">修改
                        </button>
                        <button class="layui-btn" lay-filter="demo1"
                                onclick="location.href='book?method=delete&b_id=${book.b_id}'">删除
                        </button>
                <%--<div class="layui-btn-group">
                    <button type="button" onclick="location.href='book?method=input&b_id=${book.b_id}'" class="layui-btn">编辑</button>
                    <button type="button" onclick="location.href='book?method=delete&b_id=${book.b_id}'" class="layui-btn">删除</button>
                </div>--%>
            </td>
        </tr>
    </c:forEach>
</table>
<script>
    $(function () {
        $("#query").click(function () {
            var inputList = document.getElementsByClassName("isEmpty");
            var str = "";
            for (var i = 0; i < 4; i++) {
                console.log(inputList[i].value);
                str += inputList[i].value;
            }
            console.log(str);
            if (str === null || str.length === 0) {
                alert("查询条件不能为空!");
                return false;
            }
        })
    });
</script>
</body>
</html>
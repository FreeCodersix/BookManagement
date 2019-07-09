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

    <style>
        *{
            margin: 0;
            padding: 0;
        }
        .query_head{
            display: inline-block;
            width: 50px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            font-size: 16px;
            color: #cccccc;
            font-weight: bolder;
            font-family: "微软雅黑";
            border: none;
        }
        .query_input{
            border: none;
        }
        .input{
            height: 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<form action="book" method="post">
    <input type="hidden" name="method" value="list"/><%--param.id也可以--%>
    <table border="1" width="800" style="border: none">
        <tr style="border: none">
            <td class="query_head">书名</td>
            <td class="query_input"><input type="text" name="b_name" size="20" class="input"></td>
            <td class="query_head">类别</td>
            <td class="query_input"><input type="text" name="b_class" size="20" class="input"></td>
            <td class="query_head">作者</td>
            <td class="query_input"><input type="text" name="b_author" size="20" class="input"></td>
            <td class="query_head">出版社</td>
            <td class="query_input"><input type="text" name="b_publisher" size="20" class="input"></td>
            <td><input type="submit" value="查询"></td>
        </tr>
    </table>
</form>
<input type="button" value="添加" onclick="location.href='book?method=input'">


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
        <th width="550">简介</th>
        <th>操作</th>
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
            <td>${book.b_comment}</td>
            <td>
                <a href="book?method=input&b_id=${book.b_id}">修改</a>
                <a href="book?method=delete&b_id=${book.b_id}">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
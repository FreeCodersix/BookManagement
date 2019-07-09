<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/9
  Time: 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>公司管理列表</title>
</head>
<body>
<form action="book" method="post">
    <input type="hidden" name="method" value="list"/><%--param.id也可以--%>
    <table border="1" width="480">
        <tr>
            <td>书名</td>
            <td><input type="text" name="b_name" size="20"></td>
            <td>类别</td>
            <td><input type="text" name="b_class" size="20"></td>
        </tr>
        <tr>
            <td>作者</td>
            <td><input type="text" name="b_author" size="20"></td>
            <td>出版社</td>
            <td><input type="text" name="b_publisher" size="20"></td>
            <td><input type="submit" value="查询"></td>
        </tr>
    </table>
</form>
<input type="button" value="添加" onclick="location.href='book?method=input'">


<table border="1" style="width: 100% ;height: 100%;text-align: center;" lay-filter="parse-table-demo" class="layui-hide" id="test">
    <tr>
        <th>序号</th>
        <th>ID</th>
        <th>书名</th>
        <th>类别</th>
        <th>数量</th>
        <th>作者</th>
        <th>出版社</th>
        <th>出版日期</th>
        <th>简介</th>
    </tr>

    <%--@elvariable id="companyList" type="java.util.List"--%>
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
                <a href="?method=input&id=${book.b_id}">修改</a>
                <a href="?method=delete&id=${book.b_id}">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
<%--<div class="layui-btn-group demoTable" style="margin-bottom: 10px;">--%>
    <%--<button class="layui-btn" data-type="parseTable">立即转化为数据表格</button>--%>
<%--</div>--%>
<%--<script src="//res.layui.com/layui/dist/layui.js" charset="utf-8"></script>--%>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<%--<script>--%>
    <%--layui.use('table', function(){--%>
        <%--var table = layui.table;--%>

        <%--table.render({--%>
            <%--elem: '#test'--%>
            <%--,url:'/demo/table/user/'--%>
            <%--,cols: [[--%>
                <%--{field:'num', width:80, title: 'num', sort: true},--%>
                <%--{field:'id', width:80, title: 'ID', sort: true}--%>
                <%--// ,{field:'username', width:80, title: '用户名'}--%>
                <%--,{field:'username', width:80, title: '公司'}--%>
                <%--,{field:'sex', width:80, title: '性别', sort: true}--%>
                <%--,{field:'city', width:80, title: '城市'}--%>
                <%--,{field:'sign', title: '签名', minWidth: 150}--%>
                <%--,{field:'experience', width:80, title: '积分', sort: true}--%>
                <%--,{field:'score', width:80, title: '评分', sort: true}--%>
                <%--,{field:'classify', width:80, title: '职业'}--%>
                <%--,{field:'wealth', width:135, title: '财富', sort: true}--%>
            <%--]]--%>
            <%--,page: true--%>
        <%--});--%>
    <%--});--%>
<%--</script>--%>
</body>
</html>

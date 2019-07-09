<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>公司管理列表</title>
</head>
<body>
<form action="company" method="post">
    <input type="hidden" name="method" value="list"/><%--param.id也可以--%>
<table border="1" width="480">
    <tr>
        <td>公司</td>
        <td><input type="text" name="name" size="20"></td>
        <td>老板</td>
        <td><input type="text" name="c_boss" size="20"></td>
    </tr>
    <tr>
        <td>年限</td>
        <td><input type="text" name="start_year" size="5"> —
        <input type="text" name="end_year" size="5"></td>
        <td>地址</td>
        <td><input type="text" name="c_city" size="20"></td>
        <td><input type="submit" value="查询"></td>
    </tr>
</table>
</form>
<input type="button" value="添加"  onclick="location.href='company?method=input'">


<table border="1"  style="width: 100% ;height: 100%;text-align: center;">
	<tr>
		<th>序号</th>
		<th>ID</th>
		<th>公司</th>
		<th>老板</th>
		<th>城市</th>
		<th>年限</th>
		<th>操作</th>
	</tr>

	<%--@elvariable id="companyList" type="java.util.List"--%>
	<c:forEach var= "company" items="${companyList}" varStatus="vs">

	<tr>
		<td>${vs.count}</td>
		<td>${company.id}</td>
		<td>${company.name}</td>
		<td>${company.c_boss}</td>
		<td>${company.c_city}</td>
		<td>${company.c_year}</td>
		<td>
			<a href="?method=input&id=${company.id}">修改</a>
			<a href="?method=delete&id=${company.id}">删除</a>
		</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>添加/修改页面</h2>
<form action="company?method=save" method="post">
<input type="hidden" name="id" value="${company.id}"/><%--param.id也可以--%>
	公司：<input type="text" name="name" value="${company.name}" size="30"><br/>
            老板：<input type="text" name="c_boss" value="${company.c_boss}" size="30"><br/>
            年限：<input type="text" name="c_year" value="${company.c_year}" size="30"><br/>
            城市：<input type="text" name="c_city" value="${company.c_city}" size="30"><br/>
	<input type="submit" value="保存">
	<input type="reset" value="重置">
	<input type="button" onclick="history.go(-1);" value="返回">
</form>
</body>
</html>
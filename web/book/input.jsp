<%--@elvariable id="book" type="train.entity.Book"--%>
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
<form action="book?method=save" method="post">
<input type="hidden" name="b_id" value="${book.b_id}"/><%--param.id也可以--%>
	书名：<input type="text" name="b_name" value="${book.b_name}" size="30"><br/>
	类别：<input type="text" name="b_class" value="${book.b_class}" size="30"><br/>
	数量：<input type="text" name="b_no" value="${book.b_no}" size="30"><br/>
	作者：<input type="text" name="b_author" value="${book.b_author}" size="30"><br/>
	出版社：<input type="text" name="b_publisher" value="${book.b_publisher}" size="30"><br/>
	出版日期：<input type="text" name="b_pubDate" value="${book.b_pubDate}" size="30"><br/>
	简介：<input type="text" name="b_comment" value="${book.b_comment}" size="30"><br/>
	<input type="submit" value="保存">
	<input type="reset" value="重置">
	<input type="button" onclick="history.go(-1);" value="返回">
</form>
</body>
</html>
<%@ page import="util.checkUser" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/9
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String sex = request.getParameter("sex");
    String str = request.getParameter("birthday").toString().toString();
    SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
    java.sql.Date birthday = new java.sql.Date(format.parse(str).getTime());
    int age = Integer.parseInt(request.getParameter("age"));
    String tel = request.getParameter("phone");
    String addr = request.getParameter("address");
        checkUser.Insert(username,password,sex, birthday,age,tel,addr);
%>
<script>
    location.href = "index.jsp";
</script>
</body>
</html>

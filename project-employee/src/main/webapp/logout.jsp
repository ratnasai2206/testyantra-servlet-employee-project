<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
session.invalidate();
%>
<h2 style="color: red">Logout Successfully......!!., Please Login Once Again..!! </h2>
<%@
include file="Login.html"
 %>
</body>
</html>
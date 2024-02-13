<%@page import="com.user.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manager Dashboard</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction:column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h1 {
            color: black;
            font-size: 24px;
            text-decoration: underline;
        }
         .button {
            width: 100px;
            padding: 10px;
            margin-top: 10px;
          	background-color: #2196F3;
            font-size:13px;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            display: block;
            text-decoration: none;
            text-align: center;
             box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        .a{
         text-decoration: none;
        }
         .button:hover {
            background-color: #0b7dda;
        }
        .logout{
        background-color: red;
        }
        .logout:hover {
            background-color: red;
        }
 </style>
</head>
<body>

<h1>Manager Home Page</h1>
<% Users user=(Users)session.getAttribute("manager"); %>
<h2>Welcome to the Dashboard, <%=user.getUser_Name() %></h2>

<a href="details.jsp" class="a"><button class="button">Details</button></a>
&nbsp;&nbsp;
<a href="addtask.jsp" class="a"><button class="button">Add Task</button></a>
&nbsp;&nbsp;
<a href="managerviewtask.jsp" class="a"><button class="button">View Task</button></a>
&nbsp;&nbsp;
<a href="logout.jsp" class="a"><button class="button logout">Logout</button></a>
</body>
</html>
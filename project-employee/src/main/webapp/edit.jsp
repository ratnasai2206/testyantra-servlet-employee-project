
<%@page import="com.user.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update details</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        form {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 50%;
            margin: 200px auto;
        }

        input[type="text"] {
            width: 300px;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
       

        input[type="submit"] {
            width: 75%;
            padding: 10px;
            margin-top: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
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

        input[type="submit"]:hover {
            background-color: #45a049;
        }
          .logout{
        background-color: red;
         margin-top:-12%;
         margin-left: 47%;
        }
        .logout:hover {
            background-color: red;
        }
         .a{
         text-decoration: none;
         
        }
    </style>
</head>
<body>
<% Users user=(Users)session.getAttribute("user"); %>
    <form action="update" method="post">
        <input type="hidden" value="<%=user.getUser_Id() %>" name="user_Id">

        <center>
        <table>
            <tr>
                <td>User Name is :</td>
                <td>:</td>
                <td><input type="text" value="<%=user.getUser_Name() %>" name="user_Name"></td>
            </tr>
            <tr>
                <td>User Email is </td>
                <td>:</td>
                <td><input type="text" value="<%= user.getUser_Email()%>" name="user_Email"></td>
            </tr>
            <tr>
                <td>User Password is </td>
                <td>:</td>
                <td><input type="text" value="<%= user.getUser_Password()%>" name="user_Password"></td>
            </tr>
        </table>

        <input type="submit" value="Update">
        </center>
    </form>
<a href="logout.jsp" class="a"><button class="button logout">logout</button></a>
</body>
</html>
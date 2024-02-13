<%@page import="com.user.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Details</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin-top: 100px;
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
        table {
            border-collapse: collapse;
            width: 50%;
            margin: 10px auto;
        }

        td, th {
          
            text-align: left;
            padding: 5px;
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


<%Users user=(Users)session.getAttribute("user");
%>

<h2><u>USER DETAILS </u></h2>

<table>
<tr>
<td><h2>User Id is </h2></td>
<td><h2>:</h2></td>
<td><h2><%=user.getUser_Id() %></h2></td>
<td><a href="edit.jsp" class="a"><button class="button">edit</button></a></td>
</tr>
<tr>
<td><h2>User Name is :</h2></td>
<td><h2>:</h2></td>
<td><h2><%=user.getUser_Name() %></h2></td>
</tr>
<tr>
<td><h2>User Email is </h2></td>
<td><h2>:</h2></td>
<td><h2><%= user.getUser_Email() %></h2></td>
</tr>
<tr>
<td><h2>User Password is  </h2></td>
<td><h2>:</h2></td>
<td><h2><%=user.getUser_Password() %></h2></td>
</tr>
<tr>
<td><h2>User Role is </h2></td>
<td><h2>:</h2></td>
<td><h2><%=user.getRole()%></h2></td>
</tr>
<tr>
<td><h2>User Designation is </h2></td>
<td><h2>:</h2></td>
<td><h2><%=user.getUser_Designation() %></h2></td>
</tr>
<tr>
<td><h2>User Salary is   </h2></td>
<td><h2>:</h2></td>
<td><h2><%=user.getUser_Salary() %></h2></td>
<td><a href="logout.jsp" class="a"><button class="button logout">logout</button></a></td>
</tr>
</table>
<br>



</body>
</html>
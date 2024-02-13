<%@page import="com.user.entity.Task"%>
<%@page import="com.user.helper.UserFactory"%>
<%@page import="com.user.entity.Users"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manager View Task</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            margin-top:250px;
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
         table {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 50%;
            margin: 20px auto;
             border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 2px dotted  #ccc;
            border-radius: 8px;
        }
  

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            padding: 10px;
        }
        th {
            background-color: #f2f2f2;
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
<h1><u>Task details :</u></h1>
<%
List<Users> users=UserFactory.getUserDao().getEmployeeList();
for(Users user: users){
	List<Task> task=user.getTasks();
%>
<table>
        <tr>
            <th>Task ID</th>
            <th>Task Description</th>
            <th>Task Assigned Time</th>
            <th>Task Status</th>
            <th>Task Submited Time</th>
        </tr>
<h3><u>Task list of <%=user.getUser_Name() %></u></h3>
<% for(Task tasks: task){
	String task_Status=tasks.getTask_Status();%>
	<tr>
		   <td><center><%= tasks.getTask_Id() %></center></td>
            <td><%= tasks.getTask_Description() %></td>
            <td><%= tasks.getCreate_Time() %></td>
            <td><%= task_Status %></td>
            <% if(!task_Status.equals("assigned")) { %>
            <td><%= tasks.getUpdate_Time() %></td>
            <% } else { %>
            <td><center>n/a</center></td>
            
            <% } %>
	</tr>
<%} %>
<%} %>
</table>
&nbsp;&nbsp;
<a href="logout.jsp" class="a" ><button class="button logout">Logout</button></a>
</body>
</html>
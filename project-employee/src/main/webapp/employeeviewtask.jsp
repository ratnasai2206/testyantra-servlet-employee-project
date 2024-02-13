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
<title>Employee View Task</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            margin-top:100px;
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
<% Users user=(Users)session.getAttribute("employee");
List<Task> task=UserFactory.getUserDao().viewAllTask(user.getUser_Id());
for(Task tasks:task){
%>
<table>
        <tr>
            <th>Task ID</th>
            <td><%=tasks.getTask_Id() %></td>
        </tr>
        <tr>
            <th>Task Description</th>
            <td><%=tasks.getTask_Description() %></td>
        </tr>
        <tr>
            <th>Task Assigned Time</th>
            <td><%=tasks.getCreate_Time() %></td>
        </tr>
        <tr>
            <th>Task Status</th>
            <td><%=tasks.getTask_Status()%></td>
        </tr>
    </table>
<form action="edit_task_status" method="post">
Update Status to :
<select name="task_status">
 <option disabled selected="selected">select the status</option>
<option value="assigned">assigned</option>
<option value="completed">completed</option>
</select>
<button class="" name="task_id" value="<%= tasks.getTask_Id()%>">update</button>
</form>
<h3>--------------------------------------------------------------</h3>
<%} %>
<a href="logout.jsp" class="a" ><button class="button logout">Logout</button></a>

</body>
</html>
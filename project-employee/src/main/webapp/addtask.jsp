<%@page import="com.user.entity.Users"%>
<%@page import="com.user.helper.UserFactory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Task</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            margin-top: 100px;
        }

        form {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 50%;
            margin: 20px auto;
        }

        table {
            width: 100%;
        }

        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        input[type="text"], textarea {
            width: calc(100% - 10px);
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        select {
            width: calc(100% - 10px);
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
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
        
         .button:hover {
            background-color: #0b7dda;
        }
        .logout{
        background-color: red;
         margin-left:46.5%;
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
<h1><center><u>Task assign to the employee</u></center> </h1>

<% 
	List<Users> users=UserFactory.getUserDao().getEmployeeList(); 
	
%>
<form action="addtask" method="post">
        <table>
            <tr>
                <th>Task Description</th>
                <td><textarea rows="3" cols="30" name="Task_Description" required="required"></textarea></td>
            </tr>
            <tr>
                <th>Status Of Task</th>
                <td><input type="text" value="assign" disabled="disabled" name="Task_status"></td>
            </tr>
            <tr>
                <th>Employee Id</th>
                <td>
                    <select name="Employee_Id">
                    <option disabled="disabled" selected="selected">select the employee id for assigning task</option>
                        <%for(Users user:users){%>
                            <option value="<%= user.getUser_Id() %>"><%= user.getUser_Id() %></option>
                        <% }%>
                    </select>
                </td>
            </tr>
        </table>
        <input type="submit" value="Assign">
    </form>
<br>
<a href="logout.jsp" class="a" ><button class="button logout">Logout</button></a>
</body>
</html>
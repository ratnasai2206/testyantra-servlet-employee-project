package com.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.dao.TaskDao;
import com.user.entity.Task;
import com.user.helper.TaskFactory;

@WebServlet(value = "/addtask")
public class UserAddTask extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String task_Description=req.getParameter("Task_Description");
		String task_Status=req.getParameter("Task_status");
		int employee_Id=Integer.parseInt(req.getParameter("Employee_Id"));
		
		Task task=TaskFactory.getTask(task_Description);
		TaskDao dao=TaskFactory.getTaskDao();
		Task tasks=dao.addTask(employee_Id, task);
		
		if(tasks!=null) {
			PrintWriter printWriter=resp.getWriter();
			printWriter.print("<html><body><h2><center>Task Added Successfully</center></h2></body></html>");
			RequestDispatcher dispatcher=req.getRequestDispatcher("addtask.jsp");
			dispatcher.include(req, resp);
		}
	}
}

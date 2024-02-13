package com.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.dao.TaskDao;
import com.user.entity.Task;
import com.user.helper.TaskFactory;

@WebServlet(value = "/edit_task_status")
public class User_Edit_Task extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String task_Status=req.getParameter("task_status");
		int task_Id=Integer.parseInt(req.getParameter("task_id"));
		
		Task task=TaskFactory.getTaskDao().editTask(task_Id, task_Status);
		RequestDispatcher dispatcher=req.getRequestDispatcher("employeeviewtask.jsp");
		dispatcher.forward(req, resp);
	}
}

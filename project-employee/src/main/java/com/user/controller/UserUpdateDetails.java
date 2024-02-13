package com.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.entity.Users;
import com.user.helper.UserFactory;
@WebServlet(value = "/update")
public class UserUpdateDetails extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName = req.getParameter("user_Name");
		String userEmail = req.getParameter("user_Email");
		String userPassword = req.getParameter("user_Password");
		String user_Id=req.getParameter("user_Id");
		Users users=UserFactory.getUserDao().searchById(Integer.parseInt(user_Id));
		if(users!=null) {
			Users user=UserFactory.getUserDao().updateDetails(userName,userEmail,userPassword,users);
			PrintWriter printWriter = resp.getWriter();
			printWriter.print("<html><body><h2>UPDATED SUCCESSFULLY......!!</h2></body></html>");
			RequestDispatcher dispatcher=req.getRequestDispatcher("details.jsp");
			dispatcher.include(req, resp);
			
		}
		
	}
}

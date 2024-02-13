package com.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.dao.UserDao;
import com.user.entity.Users;
import com.user.helper.UserFactory;

@WebServlet(value = "/registration")
public class UserRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String user_Name=req.getParameter("user_name");
		String user_Email=req.getParameter("user_email");
		String user_Password=req.getParameter("user_password");
		String user_Role=req.getParameter("user_role");
		String user_Designation=req.getParameter("user_designation");
		String user_Salary=req.getParameter("user_salary");
		
		Users users=UserFactory.getUser(user_Name, user_Email, user_Password, user_Role, user_Designation, Double.parseDouble(user_Salary));
		UserDao crud=UserFactory.getUserDao();
		Users user=crud.saveUser(users);
		PrintWriter printWriter=resp.getWriter();
		if(user!=null) {
			HttpSession httpSession=req.getSession();
			httpSession.setAttribute("user", user);
			
			printWriter.print("<html><body>");
			printWriter.print("<h2>Registered.............Successfully...!!</h2>");
			printWriter.print("</body></html>");
			RequestDispatcher dispatcher=req.getRequestDispatcher("Login.html");
			dispatcher.include(req, resp);
		}else {
			printWriter.print("<html><body>");
			printWriter.print("<h2>User email is not available...!!</h2>");
			printWriter.print("</body></html>");
			RequestDispatcher dispatcher=req.getRequestDispatcher("registration.html");
			dispatcher.include(req, resp);
		}
	}
}

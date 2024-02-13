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


@WebServlet(value = "/user-login")
public class UserLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String user_Email=req.getParameter("user_email");
		String user_Password=req.getParameter("user_password");
		
		UserDao dto=UserFactory.getUserDao();
		Users user =dto.validateUser(user_Email, user_Password);
		HttpSession httpSession=req.getSession();
		if(user!=null) {
			httpSession.setAttribute("manager", user);
			httpSession.setAttribute("user", user);
			if(user.getRole().equals("manager")) {
				RequestDispatcher dispatcher=req.getRequestDispatcher("ManagerHomePage.jsp");
				dispatcher.forward(req, resp);
			}else {
				httpSession.setAttribute("employee", user);
				httpSession.setAttribute("user", user);
				RequestDispatcher dispatcher=req.getRequestDispatcher("EmployeeHomePage.jsp");
				dispatcher.forward(req, resp);
			}
		}else {
			PrintWriter printWriter=resp.getWriter();
			printWriter.print("<html><body>");
			printWriter.print("<h2 style='color: red'>Entered User Email or Password is incorrect please try again...!</h2>");
			printWriter.print("</body></html>");
			RequestDispatcher dispatcher=req.getRequestDispatcher("Login.html");
			dispatcher.include(req, resp);
		}
		
	}
}

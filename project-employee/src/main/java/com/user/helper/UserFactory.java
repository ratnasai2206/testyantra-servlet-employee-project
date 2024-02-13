package com.user.helper;

import java.util.ArrayList;

import com.user.dao.UserDao;
import com.user.entity.Task;
import com.user.entity.Users;

public class UserFactory {
	
	public static Users getUser(String user_Name,String user_Email,String user_Password,String user_Role,String user_Designation,double user_Salary) {
		Users users=new Users();
		users.setUser_Name(user_Name);
		users.setUser_Email(user_Email);
		users.setUser_Password(user_Password);
		users.setRole(user_Role);
		users.setUser_Designation(user_Designation);
		users.setUser_Salary(user_Salary);
		users.setTasks(new ArrayList<Task>());
		return users;
	}
	
	public static UserDao getUserDao() {
		return new UserDao();	
	}

	

}

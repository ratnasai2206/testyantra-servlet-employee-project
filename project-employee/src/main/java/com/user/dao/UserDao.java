package com.user.dao;



import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.user.entity.Task;
import com.user.entity.Users;
import com.user.helper.EntityFactory;

public class UserDao {
	
	EntityManager entityManager= EntityFactory.entityManager;
	EntityTransaction entityTransaction=EntityFactory.entityTransaction;
	
	
	public Users saveUser(Users user) {
		
		if(user!=null && searchUserByEmail(user.getUser_Email())) {
			entityTransaction.begin();
			entityManager.persist(user);
			entityTransaction.commit();
		}else {
			user=null;
		}
		return user;
		
	}
	
	public Users validateUser(String user_Email,String user_Password ) {
		
		List<Users> users =null;
		if(user_Email!=null && user_Password!=null) {
			Query query = entityManager.createQuery("Select u from Users u where u.user_Email=?1 and user_Password=?2");
			query.setParameter(1, user_Email);
			query.setParameter(2, user_Password);
			users = query.getResultList();
		}
		if(users.size()!=0) {
			return users.get(0);	
		}else {
			return null;
		}
	}
	
	public boolean searchUserByEmail(String user_Email) {
		List<Users> users =null;
		if(user_Email!=null) {
			Query query = entityManager.createQuery("Select u from Users u where u.user_Email=?1");
			query.setParameter(1, user_Email);
			users = query.getResultList();
		}
		return users.size()==0;
	}
	public List<Users> getEmployeeList(){
		
		Query query = entityManager.createQuery("Select u from Users u where u.role='employee'");
		List<Users> users =query.getResultList();
		return users;
	}
	
	public Users searchById(int employee_Id) {
		Users user=entityManager.find(Users.class, employee_Id);
		return user;
	}
	
	public List<Task> viewAllTask(int user_Id){
		Query query=entityManager.createQuery("SELECT t FROM Users u JOIN u.tasks t WHERE u.user_Id =?1 ORDER BY t.task_Status");
		query.setParameter(1, user_Id);
		return query.getResultList();
	}
	
	public  Users updateDetails(String userName, String userEmail, String userPassword, Users users) {
		if(users!=null) {
			users.setUser_Name(userName);
			users.setUser_Email(userEmail);
			users.setUser_Password(userPassword);
			
			entityTransaction.begin();
			entityManager.merge(users);
			entityTransaction.commit();
		}
		
		return users;
	}
}
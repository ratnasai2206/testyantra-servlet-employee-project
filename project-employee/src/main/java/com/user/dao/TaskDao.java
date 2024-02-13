package com.user.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.user.entity.Task;
import com.user.entity.Users;
import com.user.helper.EntityFactory;
import com.user.helper.UserFactory;

public class TaskDao {

	EntityManager entityManager= EntityFactory.entityManager;
	EntityTransaction entityTransaction=EntityFactory.entityTransaction;
	
	public Task addTask(int employee_Id,Task task) {
		
		Users user=UserFactory.getUserDao().searchById(employee_Id);
		
		if(user!=null) {
			List<Task> tasks=user.getTasks();
			tasks.add(task);
			entityTransaction.begin();
			entityManager.persist(task);
			entityManager.merge(user);
			entityTransaction.commit();
		}
		
		return task;
	}
	
	public List<Task> viewAllTasks(){
		Query query=entityManager.createQuery("select t from Task t ");
		return query.getResultList();
	}
	
	public Task editTask(int task_Id,String task_status) {
		Task task=entityManager.find(Task.class, task_Id);
		if(task!=null) {
			task.setTask_Status(task_status);
			entityTransaction.begin();
			entityManager.merge(task);
			entityTransaction.commit();
		}
		
		return task;
	}
}

package com.user.helper;

import com.user.dao.TaskDao;
import com.user.entity.Task;

public class TaskFactory {

	public static Task getTask(String task_Description) {
		Task task=new Task();
		task.setTask_Description(task_Description);
		task.setTask_Status("assigned");
		return task;
	}
	
	public static TaskDao getTaskDao() {
		return new TaskDao();
	}
}

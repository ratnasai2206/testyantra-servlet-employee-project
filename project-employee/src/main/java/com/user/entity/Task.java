package com.user.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class Task {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(insertable=false)
	private int task_Id;
	private String task_Description;
	@CreationTimestamp
	@Column(name = "Assign_task")
	private LocalDateTime create_Time;
	@UpdateTimestamp
	@Column(name = "Completed_task")
	private LocalDateTime update_Time;
	private String task_Status;
	public int getTask_Id() {
		return task_Id;
	}
	public void setTask_Id(int task_Id) {
		this.task_Id = task_Id;
	}
	public String getTask_Description() {
		return task_Description;
	}
	public void setTask_Description(String task_Description) {
		this.task_Description = task_Description;
	}
	public LocalDateTime getCreate_Time() {
		return create_Time;
	}
	public void setCreate_Time(LocalDateTime create_Time) {
		this.create_Time = create_Time;
	}
	public LocalDateTime getUpdate_Time() {
		return update_Time;
	}
	public void setUpdate_Time(LocalDateTime update_Time) {
		this.update_Time = update_Time;
	}
	public String getTask_Status() {
		return task_Status;
	}
	public void setTask_Status( String task_Status) {
		this.task_Status = task_Status;
	}
	
}
package com.user.entity;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Users {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(insertable=false)
	private int user_Id;
	private String user_Name;
	@Column(unique = true)
	private String user_Email;
	private String user_Password;
	private String role;
	private String user_Designation;
	private double user_Salary;
	@CreationTimestamp
	private LocalDateTime user_Date_Time;
	@OneToMany
	List<Task> tasks;
	public int getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(int user_Id) {
		this.user_Id = user_Id;
	}
	public String getUser_Name() {
		return user_Name;
	}
	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}
	public String getUser_Email() {
		return user_Email;
	}
	public void setUser_Email(String user_Email) {
		this.user_Email = user_Email;
	}
	public String getUser_Password() {
		return user_Password;
	}
	public void setUser_Password(String user_Password) {
		this.user_Password = user_Password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getUser_Designation() {
		return user_Designation;
	}
	public void setUser_Designation(String user_Designation) {
		this.user_Designation = user_Designation;
	}
	public double getUser_Salary() {
		return user_Salary;
	}
	public void setUser_Salary(double user_Salary) {
		this.user_Salary = user_Salary;
	}
	public LocalDateTime getUser_Date_Time() {
		return user_Date_Time;
	}
	public void setUser_Date_Time(LocalDateTime user_Date_Time) {
		this.user_Date_Time = user_Date_Time;
	}
	public List<Task> getTasks() {
		return tasks;
	}
	public void setTasks(List<Task> tasks) {
		this.tasks = tasks;
	}
	
	
	
}

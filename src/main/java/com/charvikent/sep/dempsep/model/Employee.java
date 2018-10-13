package com.charvikent.sep.dempsep.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Employee {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	
	private String firstName;
	
	private String LastName;
	
	private String age;
	
	private String userName;
	
	private String password;
	
	public Employee()
	{
		
	}

	public Employee(Employee user) {
		this.id = user.id;
		this.firstName = user.firstName;
		this.LastName = user.LastName;
		this.age = user.age;
		this.userName = user.userName;
		this.password =user.password;
	}

	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastName(String lastName) {
		LastName = lastName;
	}
	
	

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}
	
	
	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	
	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Employee [id=" + id + ", firstName=" + firstName + ", LastName=" + LastName + ", age=" + age
				+ ", userName=" + userName + ", password=" + password + "]";
	}


	
	
	
	

}

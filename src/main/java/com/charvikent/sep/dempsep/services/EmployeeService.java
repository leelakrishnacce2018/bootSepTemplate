package com.charvikent.sep.dempsep.services;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.charvikent.sep.dempsep.dao.EmployeeDao;
import com.charvikent.sep.dempsep.model.Employee;

@Service
@Transactional
public class EmployeeService {
	
	@Autowired
	EmployeeDao employeeDao;
	
	
	public Employee saveEmployee(Employee emp)
	{
		 return employeeDao.save(emp);
	}


	public List<Employee> findAll() {
		return (List<Employee>) employeeDao.findAll();
	}


	public Optional<Employee> findById(Long employeeId) {
		// TODO Auto-generated method stub
		return employeeDao.findById(employeeId);
	}


	

	public void deleteById(Long employeeId) {
		
       employeeDao.deleteById(employeeId);
		
	}

}

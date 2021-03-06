package com.charvikent.sep.dempsep.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.charvikent.sep.dempsep.model.Employee;
@Repository
public interface EmployeeDao extends JpaRepository<Employee, Long> {

	Employee findByUserName(String userName);

@Query("SELECT e.designationId FROM Employee e WHERE e.userName = ?1")
	List<String> findRoleByUserName(String username);

}

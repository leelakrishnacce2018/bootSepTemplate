package com.charvikent.sep.dempsep.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.charvikent.sep.dempsep.model.Employee;
@Repository
public interface EmployeeDao extends JpaRepository<Employee, Long> {

}

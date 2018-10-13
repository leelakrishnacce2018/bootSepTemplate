package com.charvikent.sep.dempsep.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.charvikent.sep.dempsep.exceptions.ResourceNotFoundException;
import com.charvikent.sep.dempsep.model.Employee;
import com.charvikent.sep.dempsep.services.EmployeeService;

@RestController
@RequestMapping("/api")
public class HomeController {
	
	@Autowired
	EmployeeService employeeService;
	
	
	
	
	@PostMapping("/employees")
	@Secured("ROLE_ADMIN")
	public Employee saveEmploye()
	{
		Employee emp =new Employee();
		emp.setFirstName("leela");
		emp.setLastName("krishna");
		emp.setAge("25");
		
		return employeeService.saveEmployee(emp);
	}
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/employees")
    public List<Employee> getAllEmployees() {
        return employeeService.findAll();
    }
	
	
	@GetMapping("/employees/{id}")
    public ResponseEntity<Employee> getEmployeeById(@PathVariable(value = "id") Long employeeId)
        throws ResourceNotFoundException {
        Employee employee = employeeService.findById(employeeId)
        .orElseThrow(() -> new ResourceNotFoundException("Employee not found for this id :: " + employeeId));
        return ResponseEntity.ok().body(employee);
    }
	
	
	
	@DeleteMapping("/employees/{id}")
    public Map<String, Boolean> deleteEmployee(@PathVariable(value = "id") Long employeeId)
        throws ResourceNotFoundException {
        Employee employee = employeeService.findById(employeeId)
        .orElseThrow(() -> new ResourceNotFoundException("Employee not found for this id :: " + employeeId));

        employeeService.deleteById(employeeId);
       Map<String, Boolean> response = new HashMap<>();
       response.put("deleted", Boolean.TRUE);
       return response;
    }
	
	
	
	@PutMapping("/employees/{id}")
    public ResponseEntity<Employee> updateEmployee(@PathVariable(value = "id") Long employeeId,
         @Valid @RequestBody Employee employeeDetails) throws ResourceNotFoundException {
         Employee employee = employeeService.findById(employeeId)
        .orElseThrow(() -> new ResourceNotFoundException("Employee not found for this id :: " + employeeId));

        employee.setAge(employeeDetails.getAge());
        employee.setLastName(employeeDetails.getLastName());
        employee.setFirstName(employeeDetails.getFirstName());
        
        final Employee updatedEmployee = employeeService.saveEmployee(employee);
        return ResponseEntity.ok(updatedEmployee);
    }
	
	
	
	
	


}

package com.charvikent.sep.dempsep.securities;



import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.charvikent.sep.dempsep.dao.EmployeeDao;
import com.charvikent.sep.dempsep.model.Employee;


@Service
public class CustomUserDetailsService implements UserDetailsService{
	private final EmployeeDao userRepository;
	private final EmployeeDao userRolesRepository;
	
	@Autowired
    public CustomUserDetailsService(EmployeeDao userRepository,EmployeeDao userRolesRepository) {
        this.userRepository = userRepository;
        this.userRolesRepository=userRolesRepository;
    }
	
        
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Employee user=userRepository.findByUserName(username);
		if(null == user){
			//return null;
		throw new UsernameNotFoundException("No user present with username: "+username);
		}else{
			List<String> userRoles=userRolesRepository.findRoleByUserName(username);
			
			List<String> list =new ArrayList<>();
			list.add("ROLE_ADMIN");
			
			return new CustomUserDetails(user,list);
		}
		
	}
		
}

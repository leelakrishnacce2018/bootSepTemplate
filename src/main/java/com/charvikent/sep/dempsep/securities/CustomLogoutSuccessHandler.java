package com.charvikent.sep.dempsep.securities;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.stereotype.Component;

import com.charvikent.sep.dempsep.model.Employee;
import com.charvikent.sep.dempsep.services.EmployeeService;

@Component
public class CustomLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler implements LogoutSuccessHandler {

	/*
	 * @Autowired private AuditService auditService;
	 * 
	 * 
	 */
	
	@Autowired EmployeeService userService;
	
	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {

		//String refererUrl = request.getHeader("Referer");
		if(authentication != null)
		{
		Employee objuserBean = (Employee)authentication.getPrincipal();
		//userService.setLoginRecord(objuserBean.getId(),"logout");
		
		}

		String URL = request.getContextPath() + "/";
		response.setStatus(HttpStatus.OK.value());
		response.sendRedirect(URL);
	}

}

package com.charvikent.sep.dempsep.utilities;


import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;


//@Configuration
//@EnableScheduling
public class TasksAlerts {

	
	
	@Autowired
	private Environment env;
	@Autowired
	SendSMS sendSMS;
	
	
	@Scheduled(cron = "1 1 10 * * ?")
	public void scheduleTaskUsingCronExpression() throws IOException {
	  
	    long now = System.currentTimeMillis() / 1000;
	    System.out.println(
	      "schedule tasks using cron jobs - " + now);
	    
	    
	}
	
	
	
	
}

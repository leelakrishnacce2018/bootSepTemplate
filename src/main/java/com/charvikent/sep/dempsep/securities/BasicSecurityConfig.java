package com.charvikent.sep.dempsep.securities;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;



@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true)
public class BasicSecurityConfig extends WebSecurityConfigurerAdapter {

 @Autowired 
 private UserDetailsService userDetailsService;
 
 @Autowired 
 private CustomAuthenicationProvider  customAuthenicationProvider;
 
 @Override
 public void configure(AuthenticationManagerBuilder auth) throws Exception {    
	// auth.userDetailsService(userDetailsService);
	 //.passwordEncoder(passwordencoder());
	 
	 auth.authenticationProvider(customAuthenicationProvider).userDetailsService(userDetailsService);
 } 
 
 @Override
 protected void configure(HttpSecurity http) throws Exception {
	 http.cors()
	     .and()
	     .csrf()
	     .disable()
	     .authorizeRequests()
	     .anyRequest()
	     .authenticated()
	     .and()
	     .httpBasic();
 }
 
 @Bean(name="passwordEncoder")
    public PasswordEncoder passwordencoder(){
     return new BCryptPasswordEncoder();
    }
}
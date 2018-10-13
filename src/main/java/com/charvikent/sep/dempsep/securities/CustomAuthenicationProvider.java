package com.charvikent.sep.dempsep.securities;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticatedPrincipal;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenicationProvider implements AuthenticationProvider {
	
	@Autowired 
	 private UserDetailsService userDetailsService;
	
	

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// TODO Auto-generated method stub
		
		String username =authentication.getName();
		String password =authentication.getCredentials().toString();
		
		UserDetails user =userDetailsService.loadUserByUsername(username);
		if(null == user){
			//return null;
		throw new UsernameNotFoundException("No user present with username: "+username);
		}
		
		if(!password .equals(user.getPassword()))
		{
			throw new UsernameNotFoundException("wrong password");
		}
	    UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(user, password, user.getAuthorities());
	    return usernamePasswordAuthenticationToken;
	}

	

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}
	
	@Bean
    public BCryptPasswordEncoder encoder() {
     return new BCryptPasswordEncoder();
    }
	

}

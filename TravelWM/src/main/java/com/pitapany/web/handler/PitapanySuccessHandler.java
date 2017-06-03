package com.pitapany.web.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class PitapanySuccessHandler implements AuthenticationSuccessHandler{

	public void onAuthenticationSuccess(
			HttpServletRequest request, 
			HttpServletResponse response,
			Authentication authentication) 
		throws IOException, ServletException {
		System.out.println(authentication.getName());
		
		response.sendRedirect("/member/index");
		
	}

}

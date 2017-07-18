package com.pitapany.web.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.pitapany.web.dao.MemberDao;
import com.pitapany.web.entity.Member;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{

	@Autowired
	private MemberDao memberDao; 
	
	public void onAuthenticationSuccess(
			HttpServletRequest request, 
			HttpServletResponse response,
			Authentication authentication) 
		throws IOException, ServletException {
		String email = authentication.getName();
		String id = memberDao.getIdByEmail(email);
		
		Member member = memberDao.get(id);
		
		//request.getSession().setAttribute("user", member);
		response.sendRedirect(request.getContextPath()+"/member/is-prof-set");
		
	}

}

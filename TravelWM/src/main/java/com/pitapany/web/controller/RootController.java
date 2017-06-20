package com.pitapany.web.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.SessionScope;

@Controller
public class RootController {

	@RequestMapping(value="/index")
	public String index(Principal principal) {
		
		String memberId = principal.getName();
		System.out.println(memberId);
		String role = "ROLE_USER";
		
		if(role.equals("ROLE_USER"))
			return "member.main";
		else
			return "member.main";
	}
}

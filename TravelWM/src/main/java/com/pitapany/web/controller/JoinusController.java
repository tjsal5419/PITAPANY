package com.pitapany.web.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/joinus/*")
public class JoinusController {
	
	@RequestMapping("login")
	public String login() {
		return "joinus/login";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login";
	}
	
	@RequestMapping("join")
	public String join() {
		return "joinus.join";
	}
	
	@RequestMapping("mainpage")
	public String mainpage(Principal principal) {
		String memberId = principal.getName();
		
		String role = "ROLE_ADMIN";
		
		if(role.equals("ROLE_ADMIN"))
			return "redirect:/admin/mainpage";
		else
			return "redirect:/member/mainpage";	
	}
}

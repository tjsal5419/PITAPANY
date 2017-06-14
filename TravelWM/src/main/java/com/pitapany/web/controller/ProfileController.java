package com.pitapany.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.SessionScope;

@Controller
@RequestMapping("/profile/*")
public class ProfileController {
	
	@RequestMapping("/home")
	public String home() {
		return "profile.home";
	}
	
	@RequestMapping("/homeCopy")
	public String homeCopy() {
		return "profile.homeCopy";
	}
	
}

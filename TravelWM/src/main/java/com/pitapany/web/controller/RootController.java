package com.pitapany.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.SessionScope;

@Controller
public class RootController {
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}

}

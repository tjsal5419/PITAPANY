package com.pitapany.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.SessionScope;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@RequestMapping("index")
	
	public String memberIndex(){
		return "member.index";
	}
}

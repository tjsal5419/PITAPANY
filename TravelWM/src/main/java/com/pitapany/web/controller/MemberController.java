package com.pitapany.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.SessionScope;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@RequestMapping("index")
	
	public String memberIndex(){
		return "member.index";
	}
	@RequestMapping("/main")
	public static String main(Model model){
		return "member.main";
	}
	@RequestMapping("/acc-setting")
	public static String accSetting(Model model){
		return "member.acc-setting";
	}
	@RequestMapping("/bookmark")
	public static String bookmark(Model model){
		return "member.bookmark";
	}
	@RequestMapping("/profile-setting")
	public static String profileSetting(Model model){
		return "member.profile-setting";
	}
}

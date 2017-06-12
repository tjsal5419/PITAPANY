package com.pitapany.web.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/community/*")
public class CommunityController {

	@RequestMapping("tip")
	public String tip(){
		return "community.tip";
	}
	
	@RequestMapping("faq")
	public String faq(){
		return "community.faq";
	}

}

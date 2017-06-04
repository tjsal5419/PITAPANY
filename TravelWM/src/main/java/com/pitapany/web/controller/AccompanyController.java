package com.pitapany.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/accompany/*")
public class AccompanyController {
	
	@RequestMapping("/matching")
	public static String  matching(Model model){
		return "accompany.matching";
	}
	

	@RequestMapping("/detail")
	public static String  detail(Model model){
		return "accompany.detail";
	}
	
	@RequestMapping("/reg")
	public static String  reg(Model model){
		return "accompany.reg";

	}
	
	@RequestMapping("/board")
	public static String  board(Model model){
		return "accompany.board";

	}
}

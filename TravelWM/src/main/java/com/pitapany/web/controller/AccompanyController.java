package com.pitapany.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.SessionScope;

@Controller
@RequestMapping("/accompany/*")
public class AccompanyController {
	
	@RequestMapping("/matching")
	public static String  matching(Model model){
		return "accompany.matching";
	}
	
	@RequestMapping("/accompanyBoard")
	public static String  accompanyBoard(Model model){
		return "accompany.accompany-board";
	}
}

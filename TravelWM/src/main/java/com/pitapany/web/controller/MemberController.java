package com.pitapany.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.annotation.SessionScope;

import com.pitapany.web.dao.AccompanyBoardDao;
import com.pitapany.web.entity.AccompanyBoardView;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private AccompanyBoardDao accompanyBoardDao;

	
	@RequestMapping("index")
	
	public String memberIndex(){
		return "member.index";
	}
	
	@RequestMapping(value="/main",
			method=RequestMethod.GET)
	public String main(Model model){	
		List<AccompanyBoardView> accomBoardMainList = accompanyBoardDao.getMainList();
		
		for(int i=0;i<accomBoardMainList.size();i++){
		System.out.println("´Ð³×ÀÓ"+accomBoardMainList.get(i).getWriterNicName());
		
		}
		model.addAttribute("accomBoardMainList", accomBoardMainList);
		
		return "member.main";
	}
	
	@RequestMapping("/acc-setting")
	public String accSetting(Model model){
		return "member.acc-setting";
	}
	
	@RequestMapping("/bookmark")
	public String bookmark(Model model){
		return "member.bookmark";
	}
	
	@RequestMapping("/profile-setting")
	public static String profileSetting(Model model){
		return "member.profile-setting";
	}
	
}

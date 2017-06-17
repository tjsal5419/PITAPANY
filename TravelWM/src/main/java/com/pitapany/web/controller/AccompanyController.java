package com.pitapany.web.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pitapany.web.dao.AccompanyBoardDao;
import com.pitapany.web.dao.StyleDao;
import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.Member;
import com.pitapany.web.entity.Style;

@Controller
@RequestMapping("/accompany/*")
public class AccompanyController {
	
	@Autowired
	private StyleDao styleDao;

	@Autowired
	private AccompanyBoardDao accompanyDao;
	
	@RequestMapping("/matching")
	public String  matching(Model model){
		List<Style> list = styleDao.getList();
		model.addAttribute("styles", list);
		return "accompany.matching";
	}
	

	@RequestMapping("/detail")
	public String  detail(Model model){
		return "accompany.detail";
	}
	
	@RequestMapping(value="/reg",
			method=RequestMethod.GET)
	public String  reg(Model model){
		List<Style> stlyeList = styleDao.getList();
		model.addAttribute(stlyeList);
		return "accompany.reg";

	}

	@RequestMapping(value="/reg",
			method=RequestMethod.POST)
	public String regPost(Model model,
			@RequestParam(value="title",defaultValue="")String title,
			@RequestParam(value="lat",defaultValue="0.0")float lat,
			@RequestParam(value="lng",defaultValue="0.0")float lng,
			@RequestParam(value="content",defaultValue="")String content,
			@RequestParam(value="style",defaultValue="")String styleId,
			@RequestParam(value="img", defaultValue="")String img){		
/*
		System.out.println("하하");
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("user");
		String memberId = member.getId();	
		System.out.println(memberId);
*/		
		AccompanyBoard accompanyBoard = new AccompanyBoard();
		accompanyBoard.setContext(content);
		accompanyBoard.setLatitude(lat);
		accompanyBoard.setLongitude(lng);
		accompanyBoard.setTitle(title);

		
		accompanyBoard.setStartDate("1111-11-11");
		accompanyBoard.setEndDate("1111-11-11");

		accompanyBoard.setStyleId(styleId);
		accompanyBoard.setMemberId("1");
		
		if(!img.equals(""))
			accompanyBoard.setImg(img);
		
		accompanyDao.add(accompanyBoard);
		
		
		model.addAttribute("url","accompany/board");
		model.addAttribute("msg","성공적으로 동행등록이 와...와...완료...");
		
		System.out.println("등록완료");
		
		
		return "inc/redirect";
	}
	
	@RequestMapping("/board")
	public String  board(Model model){
		return "accompany.board";

	}
}

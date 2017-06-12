package com.pitapany.web.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pitapany.web.dao.CommunityTipDao;
import com.pitapany.web.dao.TipCategoryDao;
import com.pitapany.web.entity.CommunityTip;
import com.pitapany.web.entity.CommunityTipView;
import com.pitapany.web.entity.Member;
import com.pitapany.web.entity.TipCategory;

@Controller
@RequestMapping("/community/*")
public class CommunityController {

	@Autowired
	CommunityTipDao communitytipDao;
	
	@Autowired
	TipCategoryDao tipCategoryDao;
	
	@RequestMapping("tip")
	public String tip(HttpServletRequest request,
	Model model,
	@RequestParam(value="p", defaultValue="1")int page) {
		List<TipCategory> categoryList = tipCategoryDao.getList();
		model.addAttribute("categoryList", categoryList);

		List<CommunityTipView> list = communitytipDao.getList();
		model.addAttribute("tipList", list);
		return "community.tip";
	}

	@RequestMapping(value="tip-reg",
			method=RequestMethod.GET)
	public String tipReg(Model model){
		List<TipCategory> categoryList = tipCategoryDao.getList();
		model.addAttribute("categoryList", categoryList);

		System.out.println(categoryList.get(0).getCategory());
		return "community.tip-reg";
	}

	
	@RequestMapping(value="tip-reg",
			method=RequestMethod.POST
			)
	public String tipRegPost(HttpServletRequest request, 
			HttpServletResponse response,
			@RequestParam(value="content", defaultValue="")String content,
			@RequestParam(value="title", defaultValue="")String title,
			@RequestParam(value="categoryId", defaultValue="1")String tipCategoryId) {
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("user");
		
		System.out.println(member.getId());
		
		CommunityTip communityTip = new CommunityTip();
		
		communityTip.setHits("0");
		communityTip.setTitle(title);
		communityTip.setMemberId(member.getId());
		communityTip.setContent(content);
		communityTip.setTipCategoryId(tipCategoryId);
		
		communitytipDao.add(communityTip);

		return "redirect:tip";
	}
	
	
	@RequestMapping(value="tip-detail",
			method=RequestMethod.GET)
	public String tipDetail(Model model,String id) {

		CommunityTipView communityTipView = communitytipDao.get(id);
		model.addAttribute("tipView",communityTipView);
		
		return "community.tip-detail";
	}

	@RequestMapping("faq")
	public String faq() {
		return "community.faq";
	}
}

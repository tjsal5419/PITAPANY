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
	@RequestParam(value="p", defaultValue="1")int page,
	@RequestParam(value="f", defaultValue="title")String field,
	@RequestParam(value="q", defaultValue="")String query,
	@RequestParam(value="c", defaultValue="%%")String category) {
		System.out.println(field);

		List<TipCategory> categoryList = tipCategoryDao.getList();
		model.addAttribute("categoryList", categoryList);
		

		List<CommunityTipView>	list = communitytipDao.getList(page,field, query, category);
		model.addAttribute("tipList", list);

		model.addAttribute("field",field);
		model.addAttribute("query", query);
		model.addAttribute("category",category);
		model.addAttribute("page", page);
		int count = communitytipDao.count(field, query,category);
		model.addAttribute("count", count);
		int pageCount=0;
		
		if(count%10==0)
		{
			pageCount = count/10;
		}
		else{
			pageCount = count/10+1;
		}
		
		model.addAttribute("pageCount",pageCount);
		
		int prev = (page/10)*10;
		int next = 0;
		
		if(page<10)
			prev = 1;
	
		int pageBarCount = pageCount/10;
		
		if(page/10!=pageBarCount){
			if(prev/10==0)
				next = 9;
			else 
				next = prev+9;
		}
		else
			next = pageCount;
		
		/*System.out.println("page:"+page+"prev"+prev+"next:"+next);*/
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
		
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
		communitytipDao.addHits(id);

		CommunityTipView communityTipView = communitytipDao.get(id);
		
		model.addAttribute("tipView",communityTipView);
		
		return "community.tip-detail";
	}
	
	@RequestMapping(value="tip-delete",
			method=RequestMethod.GET)
	public String tipDelete(String id){
		int result = communitytipDao.delete(id);
		if(result==1)
			return "redirect:tip";
		return "";
	}

	@RequestMapping(value="tip-update",
			method=RequestMethod.GET)
	public String tipUpdate(Model model,String id){
		CommunityTip tipView = communitytipDao.get(id);
		
		List<TipCategory> categoryList = tipCategoryDao.getList();
		System.out.println(tipView.getId());
		model.addAttribute("tipView",tipView);
		model.addAttribute("categoryList", categoryList);
		return "community.tip-update";
	}

	@RequestMapping(value="tip-update",
			method=RequestMethod.POST)
	public String tipUpdate(CommunityTip tipView){
		if(communitytipDao.update(tipView)==1)
			return "redirect:tip?id="+tipView.getId();
		return "";
	}
	
	@RequestMapping("faq")
	public String faq() {
		return "community.faq";
	}
}

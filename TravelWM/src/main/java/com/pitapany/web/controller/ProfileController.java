package com.pitapany.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pitapany.web.entity.MemberProfileBoard;
import com.pitapany.web.entity.ProfHomeList;

@Controller
@RequestMapping("/profile/*")
public class ProfileController {
	
	@Autowired
	private ProfHomeList profHomeList;
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home(Model model, String id) {
		
		MemberProfileBoard board = profHomeList.getBoardList(); // 그 사람의 보드들 가져오고..리스트로 
		List<ProfHomeList> proLists = null;
		
		// 포 이치 문 돌리고
		 /*안에서 그 보드의 아이디로 댓글을 리스트로 가져와서
		 멤버프로필보드 , 그 안의 댓글 리스트를 새로운 엔티티에담아준다.*/
       
		
		proLists.add(null);
		
		/*MemberProfile memberProfile = memberProfileDao.get(id);
		List<MemberProfileBoard> memberProfileBoard = memberProfileBoardDao.getList(memberProfileId);
	    List<MemberProfileBoardReply> memberProfileBoardReply = memberProfileBoardReplyDao.getList(memberProfileBoardId);
		
		model.addAttribute("profData", memberProfile);
	    model.addAttribute("profBoard", memberProfileBoard);
	    model.addAttribute("profBoardReply", memberProfileBoardReply);*/
		
	    return "profile.home";
	}

	@RequestMapping(value = "home", method = RequestMethod.POST)
	public String home(Model model) {

		return "profile.home";
	}
}

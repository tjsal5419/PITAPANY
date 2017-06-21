package com.pitapany.web.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pitapany.web.dao.MemberDao;
import com.pitapany.web.dao.MemberProfileBoardDao;
import com.pitapany.web.dao.MemberProfileDao;
import com.pitapany.web.entity.Member;
import com.pitapany.web.entity.MemberProfileBoard;
import com.pitapany.web.entity.ProfHomeList;

@Controller
@RequestMapping("/profile/*")
public class ProfileController {
/*	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private ProfHomeList profHomeList;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberProfileDao memberprofileDao;
	
	@Autowired
	private MemberProfileBoardDao memberProfileBoardDao;
	
	@RequestMapping("home")
	public String home(Model model, String id,
			@RequestParam(value="p", defaultValue="1")Integer page) {

		int count = memberProfileBoardDao.count();
		int listPerFive = (page-1)/5;
        int checkLast = (listPerFive*5) + 5;
        
        if(count % 5 == 0)
            count = count/5;
        else
            count = (count/5)+1;
        
        if(checkLast > count)
            checkLast = count;
        model.addAttribute("listPerFive", listPerFive);
        model.addAttribute("checkLast", checkLast);
        model.addAttribute("cnt", count);
		
		
		
		System.out.println("page:"+page+"prev"+prev+"next:"+next);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
		
		 DB의 min-Limit 설정을 위한 querypage값
		int minLimitPage = (page-1)*6;
		
		List<MemberProfileBoard> profilePage = sqlsession.getMapper(MemberProfileBoardDao.class).getPage(minLimitPage);
		Member member = sqlsession.getMapper(MemberDao.class).getMember(id);
		
	
		model.addAttribute("profileBoard", profilePage);
		model.addAttribute("member", member);
		
		System.out.println(count);
		System.out.println(page);
		return "profile.home";
	}
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home(Model model, String id) {
		
		MemberProfileBoard board = profHomeList.getBoardList(); // 그 사람의 보드들 가져오고..리스트로 
		List<ProfHomeList> proLists = null;
		
		// 포 이치 문 돌리고
		 안에서 그 보드의 아이디로 댓글을 리스트로 가져와서
		 멤버프로필보드 , 그 안의 댓글 리스트를 새로운 엔티티에담아준다.
       
		
		proLists.add(null);
		
		MemberProfile memberProfile = memberProfileDao.get(id);
		List<MemberProfileBoard> memberProfileBoard = memberProfileBoardDao.getList(memberProfileId);
	    List<MemberProfileBoardReply> memberProfileBoardReply = memberProfileBoardReplyDao.getList(memberProfileBoardId);
		
		model.addAttribute("profData", memberProfile);
	    model.addAttribute("profBoard", memberProfileBoard);
	    model.addAttribute("profBoardReply", memberProfileBoardReply);
		
	    return "profile.home";
	}

	@RequestMapping(value = "home", method = RequestMethod.POST)
	public String home(Model model) {

		return "profile.home";
	}*/
}

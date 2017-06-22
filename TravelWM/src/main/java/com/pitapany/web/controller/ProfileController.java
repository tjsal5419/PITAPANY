package com.pitapany.web.controller;

import java.util.ArrayList;
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
import com.pitapany.web.dao.MemberProfileBoardReplyDao;
import com.pitapany.web.dao.MemberProfileDao;
import com.pitapany.web.entity.Member;
import com.pitapany.web.entity.MemberProfile;
import com.pitapany.web.entity.MemberProfileBoard;
import com.pitapany.web.entity.MemberProfileBoardReply;
import com.pitapany.web.entity.ProfHomeBoardAndReply;

@Controller
@RequestMapping("/profile/*")
public class ProfileController {
	
	@Autowired
	private SqlSession sqlsession;

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberProfileDao memberProfileDao;
	
	@Autowired
	private MemberProfileBoardDao memberProfileBoardDao;
	
	@Autowired
	private MemberProfileBoardReplyDao memberProfileBoardReplayDao;
/*	
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
		
		 DB�� min-Limit ������ ���� querypage��
		int minLimitPage = (page-1)*6;
		
		List<MemberProfileBoard> profilePage = sqlsession.getMapper(MemberProfileBoardDao.class).getPage(minLimitPage);
		Member member = sqlsession.getMapper(MemberDao.class).getMember(id);
		
	
		model.addAttribute("profileBoard", profilePage);
		model.addAttribute("member", member);
		
		System.out.println(count);
		System.out.println(page);
		return "profile.home";
	}
	*/
	
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home(Model model, String id) {
		
		String memberProfileId = id;
		List<MemberProfileBoard> boards = memberProfileBoardDao.getList(memberProfileId); // �� ����� ����� ��������..����Ʈ�� 
		List<ProfHomeBoardAndReply> boardAndReplyLists = new ArrayList<ProfHomeBoardAndReply>(); // �Խ���, ������ ����� ��ü ����Ʈ
		
		// �� ��ġ �� ������
		/*
		 �ȿ��� �� ������ ���̵�� ����� ����Ʈ�� �����ͼ�
		 ��������ʺ��� , �� ���� ��� ����Ʈ�� ���ο� ��ƼƼ������ش�.
       */
		
		for(MemberProfileBoard m : boards){
			
			// �Խ��� ID�� ��� ��������
			List<MemberProfileBoardReply> replyLists = memberProfileBoardReplayDao.getList(m.getId());
			// ������ ��۰� �ش� ���� ProfHomeBoardAndReply ��ü���� ����ֱ�

			// ProfHomeBoardAndReply ��ü���� ����
			ProfHomeBoardAndReply profBoardAndReply = new ProfHomeBoardAndReply();
			
			// ��ü�� �Խñ� 1�� �׿� �����ϴ� ��� ����Ʈ���� �����.
			profBoardAndReply.setBoard(m);
			profBoardAndReply.setReplyLists(replyLists);
			
			// �ϳ��� �Խñ۰� ��۸���Ʈ�� ������ ��ü�� ����Ʈ�� �������.
			boardAndReplyLists.add(profBoardAndReply);
		}

		// (�Խñ�1 +��� n��)�� ��ü�� m�� �ִ� ����Ʈ boardAndReplyLists�� �𵨿� ��������
		model.addAttribute("boardAndReplyLists",boardAndReplyLists);
		
		
		MemberProfile memberProfile = memberProfileDao.get(id);
		List<MemberProfileBoard> memberProfileBoard = memberProfileBoardDao.getList(memberProfileId);
	
		model.addAttribute("profData", memberProfile);
	    model.addAttribute("profBoard", memberProfileBoard);
	    
	    return "profile.home";
	}

	@RequestMapping(value = "home", method = RequestMethod.POST)
	public String home(Model model) {

		return "profile.home";
	}
	
	
}

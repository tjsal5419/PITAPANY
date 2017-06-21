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
		
		MemberProfileBoard board = profHomeList.getBoardList(); // �� ����� ����� ��������..����Ʈ�� 
		List<ProfHomeList> proLists = null;
		
		// �� ��ġ �� ������
		 /*�ȿ��� �� ������ ���̵�� ����� ����Ʈ�� �����ͼ�
		 ��������ʺ��� , �� ���� ��� ����Ʈ�� ���ο� ��ƼƼ������ش�.*/
       
		
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

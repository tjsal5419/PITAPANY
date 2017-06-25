package com.pitapany.web.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
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

	@RequestMapping(value = "reg", method = RequestMethod.GET)
	public String reg(Model model) {

		return "profile.reg";
	}

	@RequestMapping(value = "reg", method = RequestMethod.POST)
	public String regPost(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "lat", defaultValue = "0.0") float lat,
			@RequestParam(value = "lng", defaultValue = "0.0") float lng,
			@RequestParam(value = "content", defaultValue = "") String content,
			@RequestParam(value = "style", defaultValue = "") String styleId,
			@RequestParam(value = "img", defaultValue = "") String img,
			@RequestParam(value = "place", defaultValue = "") String place,
			@RequestParam(value = "locality", defaultValue = "") String locality,
			@RequestParam(value = "country", defaultValue = "") String country) throws ParseException {

		MemberProfileBoard memberProfileBoard = new MemberProfileBoard();
		memberProfileBoard.setContent(content);
		memberProfileBoard.setLatitude(lat);
		memberProfileBoard.setLongitude(lng);

		Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication()
				.getDetails()).getMember();
		String memberId = member.getId();
		memberProfileBoard.setMemberProfileId(member);

		if (!img.equals(""))
			memberProfileBoard.setImg(img);

		memberProfileBoard.setPlace(place);
		memberProfileBoard.setLocality(locality);
		memberProfileBoard.setCountry(country);

		memberProfileBoardDao.add(memberProfileBoard);

		model.addAttribute("url", "profile/home");
		model.addAttribute("msg", "���������� ������SNS����� ��...��...�Ϸ�...");

		return "inc/redirect";
	}

}

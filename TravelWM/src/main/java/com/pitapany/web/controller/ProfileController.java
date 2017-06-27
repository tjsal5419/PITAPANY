package com.pitapany.web.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pitapany.web.dao.MemberDao;
import com.pitapany.web.dao.MemberProfileBoardDao;
import com.pitapany.web.dao.MemberProfileBoardReplyDao;
import com.pitapany.web.dao.MemberProfileDao;
import com.pitapany.web.entity.Member;
import com.pitapany.web.entity.MemberProfile;
import com.pitapany.web.entity.MemberProfileBoard;
import com.pitapany.web.entity.MemberProfileBoardReply;
import com.pitapany.web.entity.ProfHomeBoardAndReply;
import com.pitapany.web.security.CustomWebAuthenticationDetails;

@Controller
@RequestMapping("/profile/*")
public class ProfileController {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberProfileDao memberProfileDao;
	
	@Autowired
	private MemberProfileBoardDao memberProfileBoardDao;
	
	@Autowired
	private MemberProfileBoardReplyDao memberProfileBoardReplyDao;

	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home(Model model, 
			@RequestParam(value="mId",defaultValue="default")String memberId) {
		
		if(memberId.equals("default")){
			Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication()
					.getDetails()).getMember();
			memberId = member.getId();
			
		}
		MemberProfile memberProfile = memberProfileDao.getByMemberId(memberId);
		String memberProfileId = memberProfile.getId();
		
		Member member = memberDao.get(memberId);
		List<MemberProfileBoard> boards = memberProfileBoardDao.getList(memberProfileId); // �� ����� ����� ��������..����Ʈ�� 
		List<ProfHomeBoardAndReply> boardAndReplyLists = new ArrayList<ProfHomeBoardAndReply>(); // �Խ���, ������ ����� ��ü ����Ʈ
		
		// �� ��ġ �� ������
		/*
		 �ȿ��� �� ������ ���̵�� ����� ����Ʈ�� �����ͼ�
		 ��������ʺ��� , �� ���� ��� ����Ʈ�� ���ο� ��ƼƼ������ش�.
       */
		
		for(MemberProfileBoard m : boards){
			
			// �Խ��� ID�� ��� ��������
			List<MemberProfileBoardReply> replyLists = memberProfileBoardReplyDao.getList(m.getId());
			
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

		// ��� �����ʿ� ���� ����
		model.addAttribute("memberProfile", memberProfile);
	    
		// ��� �⺻������ ���� ��
		model.addAttribute("member", member);
		
	    return "profile.home";
	}

	@RequestMapping(value = "reg", method = RequestMethod.GET)
	public String reg(Model model) {
		Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication()
				.getDetails()).getMember();
		String memberId = member.getId();
		
		MemberProfile memberProfile = memberProfileDao.getByMemberId(memberId);
		String memberProfileId = memberProfile.getId();

		model.addAttribute("id",memberProfileId);
		
		return "profile.reg";
	}

	@RequestMapping(value = "reg", method = RequestMethod.POST)
	public String regPost(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "lat", defaultValue = "0.0") float lat,
			@RequestParam(value = "lng", defaultValue = "0.0") float lng,
			@RequestParam(value = "content", defaultValue = "�ۼ��� ������ �����ϴ�.") String content,
			@RequestParam(value = "img", defaultValue = "") String img,
			@RequestParam(value = "place", defaultValue = "�̵�� ���") String place,
			@RequestParam(value = "locality", defaultValue = "�̵�� ����") String locality,
			@RequestParam(value = "country", defaultValue = "�̵�� ����") String country) throws ParseException {

		MemberProfileBoard memberProfileBoard = new MemberProfileBoard();

		//��������� �޾ƿ���
		Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication()
				.getDetails()).getMember();
		String memberId = member.getId();
		
		MemberProfile memberProfile = memberProfileDao.getByMemberId(memberId);

		//��� ���̵� �̿� �� �����ʾ��̵� �޾ƿ���
		String memberProfileId = memberProfile.getId();


		memberProfileBoard.setImg(img);
		memberProfileBoard.setMemberProfileId(memberProfileId);
		memberProfileBoard.setPlace(place);
		memberProfileBoard.setLocality(locality);
		memberProfileBoard.setCountry(country);
		memberProfileBoard.setContent(content);
		memberProfileBoard.setLatitude(lat);
		memberProfileBoard.setLongitude(lng);
		
		int add = memberProfileBoardDao.add(memberProfileBoard);
		
		if(add>0){
		model.addAttribute("url", "profile/home");
		model.addAttribute("msg", "���������� ������SNS����� �Ϸ�Ǿ����ϴ�.");
		}
		
		return "inc/redirect";
	}

}

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
		List<MemberProfileBoard> boards = memberProfileBoardDao.getList(memberProfileId); // 그 사람의 보드들 가져오고..리스트로 
		List<ProfHomeBoardAndReply> boardAndReplyLists = new ArrayList<ProfHomeBoardAndReply>(); // 게시판, 응답을 담아줄 객체 리스트
		
		// 포 이치 문 돌리고
		/*
		 안에서 그 보드의 아이디로 댓글을 리스트로 가져와서
		 멤버프로필보드 , 그 안의 댓글 리스트를 새로운 엔티티에담아준다.
       */
		
		for(MemberProfileBoard m : boards){
			
			// 게시판 ID로 댓글 가져오기
			List<MemberProfileBoardReply> replyLists = memberProfileBoardReplayDao.getList(m.getId());
			// 가져온 댓글과 해당 글을 ProfHomeBoardAndReply 객체에에 담아주기

			// ProfHomeBoardAndReply 객체부터 생성
			ProfHomeBoardAndReply profBoardAndReply = new ProfHomeBoardAndReply();
			
			// 객체에 게시글 1과 그에 대응하는 댓글 리스트들을 담아줌.
			profBoardAndReply.setBoard(m);
			profBoardAndReply.setReplyLists(replyLists);
			
			// 하나의 게시글과 댓글리스트로 구성된 객체를 리스트로 만들어줌.
			boardAndReplyLists.add(profBoardAndReply);
		}

		// (게시글1 +댓글 n개)의 객체가 m개 있는 리스트 boardAndReplyLists를 모델에 전달해줌
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
		model.addAttribute("msg", "성공적으로 프로필SNS등록이 와...와...완료...");

		return "inc/redirect";
	}

}

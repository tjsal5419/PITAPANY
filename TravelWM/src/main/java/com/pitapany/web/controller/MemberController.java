package com.pitapany.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;

import com.pitapany.web.dao.AccompanyBoardDao;
import com.pitapany.web.dao.MemberAccompanyInfoDao;
import com.pitapany.web.dao.MemberDao;
import com.pitapany.web.dao.MemberProfileDao;
import com.pitapany.web.dao.StyleDao;
import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.AccompanyBoardView;
import com.pitapany.web.entity.Member;
import com.pitapany.web.entity.MemberAccompanyInfo;
import com.pitapany.web.entity.MemberProfile;
import com.pitapany.web.entity.Style;
import com.pitapany.web.security.CustomWebAuthenticationDetails;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private AccompanyBoardDao accompanyBoardDao;
	
	@Autowired
	private MemberAccompanyInfoDao memberAccompanyInfoDao;
	
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private StyleDao styleDao;

	@Autowired
	private MemberProfileDao memberProfileDao;
	
	
	@RequestMapping("index")
	
	public String memberIndex(){
		return "member.index";
	}
	
	@RequestMapping(value="/main",
			method=RequestMethod.GET)
	public String main(Model model){
		List<AccompanyBoardView> accomBoardMainList = accompanyBoardDao.getMainList();
		Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication().getDetails()).getMember();
		String memberId = member.getId();
		
		int profCount = memberProfileDao.isRegisterd(memberId);
		
		if(profCount>0){
			model.addAttribute("accomBoardMainList", accomBoardMainList);
			
			return "member.main";
		}
		else{
			return "redirect:first-login-profile-setting";
		}
	}
	
	@RequestMapping(value="acc-setting",
			method=RequestMethod.GET)
	public String accSetting(Model model){

		Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication().getDetails()).getMember();
		String memberId = member.getId();
		
		List<MemberAccompanyInfo> memberAccomLists = memberAccompanyInfoDao.getList(memberId);
		model.addAttribute("memberAccomLists", memberAccomLists);
		
		return "member.acc-setting";
	}
	
	@RequestMapping(value="acc-setting",
			method=RequestMethod.POST)
	public String profileSetting(Model model,
			@RequestParam(value="startDate", defaultValue="1999-01-01")String sD,
			@RequestParam(value="endDate", defaultValue="1999-01-01")String eD,
			@RequestParam(value="longitude", defaultValue="0.0")float longitude,
			@RequestParam(value="latitude", defaultValue="0.0")float latitude,
			@RequestParam(value="style", defaultValue="1")String styleId,
			@RequestParam(value="locality", defaultValue="")String locality,
			@RequestParam(value="place", defaultValue="")String place,
			@RequestParam(value="country", defaultValue="")String country){
		
		
		Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication().getDetails()).getMember();
		String memberId = member.getId();
		
		MemberAccompanyInfo memberAccompanyInfo = new MemberAccompanyInfo();
		memberAccompanyInfo.setCountry(country);
		memberAccompanyInfo.setLatitude(latitude);
		memberAccompanyInfo.setLocality(locality);
		memberAccompanyInfo.setLongitude(longitude);
		memberAccompanyInfo.setMemberId(memberId);
		memberAccompanyInfo.setPlace(place);
		memberAccompanyInfo.setStyleId(styleId);
		
		java.sql.Date startDate = java.sql.Date.valueOf(sD);
		java.sql.Date endDate = java.sql.Date.valueOf(eD);
		
		memberAccompanyInfo.setStartDate(startDate);
		memberAccompanyInfo.setEndDate(endDate);
		
		memberAccompanyInfoDao.add(memberAccompanyInfo);
		
		model.addAttribute("url","member/acc-setting");
		model.addAttribute("msg",member.getNicName()+" 님의 정보가 성공적으로 등록되었습니다.");
		
		return "inc/redirect";
	}
	
	@RequestMapping(value="acc-info-delete", method=RequestMethod.GET)
	public String accInfoDelete(String id, Model model){
		int deleteCol = memberAccompanyInfoDao.delete(id);
		
		if(deleteCol>0){
			model.addAttribute("url","member/acc-setting");
			model.addAttribute("msg","삭제되었습니다.");
		}
		else{
			model.addAttribute("url","member/acc-setting");
			model.addAttribute("msg","이미 삭제된 게시글입니다.");
		}
		return "inc/redirect";
		
	}
	
	@RequestMapping(value="acc-info-edit", method=RequestMethod.POST)
	public String accInfoEdit(Model model,
			String memberAccomBoardId,
			@RequestParam(value="startDate", defaultValue="1999-01-01")String sD,
			@RequestParam(value="endDate", defaultValue="1999-01-01")String eD,
			@RequestParam(value="longitude", defaultValue="0.0")float longitude,
			@RequestParam(value="latitude", defaultValue="0.0")float latitude,
			@RequestParam(value="style", defaultValue="1")String styleId,
			@RequestParam(value="locality", defaultValue="")String locality,
			@RequestParam(value="place", defaultValue="")String place,
			@RequestParam(value="country", defaultValue="")String country){


		Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication().getDetails()).getMember();
		String memberId = member.getId();
		
		MemberAccompanyInfo memberAccompanyInfo = new MemberAccompanyInfo();
		
		// 장소를 변경했을 경우
		if(locality.length()>0){
			memberAccompanyInfo.setCountry(country);
			memberAccompanyInfo.setLatitude(latitude);
			memberAccompanyInfo.setLocality(locality);
			memberAccompanyInfo.setLongitude(longitude);
			memberAccompanyInfo.setPlace(place);			
		}
		// 변경한 장소가 없는 경우, 기존의 장소를 입력해주기
		else{
			MemberAccompanyInfo prevMemberAccompanyInfo = memberAccompanyInfoDao.get(memberAccomBoardId);
			memberAccompanyInfo.setCountry(prevMemberAccompanyInfo.getCountry());
			memberAccompanyInfo.setLatitude(prevMemberAccompanyInfo.getLatitude());
			memberAccompanyInfo.setLocality(prevMemberAccompanyInfo.getLocality());
			memberAccompanyInfo.setLongitude(prevMemberAccompanyInfo.getLongitude());
			memberAccompanyInfo.setPlace(prevMemberAccompanyInfo.getPlace());					
		}
		
		// 날짜를 변경한 경우
		if(!sD.equals("1999-01-01") && !eD.equals("1999-01-01")){
			java.sql.Date startDate = java.sql.Date.valueOf(sD);
			java.sql.Date endDate = java.sql.Date.valueOf(eD);
			
			memberAccompanyInfo.setStartDate(startDate);
			memberAccompanyInfo.setEndDate(endDate);			
		}
		else{
			MemberAccompanyInfo prevMemberAccompanyInfo = memberAccompanyInfoDao.get(memberAccomBoardId);
			memberAccompanyInfo.setStartDate(prevMemberAccompanyInfo.getStartDate());
			memberAccompanyInfo.setEndDate(prevMemberAccompanyInfo.getEndDate());				
			
		}
		
		memberAccompanyInfo.setMemberId(memberId);
		memberAccompanyInfo.setStyleId(styleId);
		memberAccompanyInfo.setId(memberAccomBoardId);
		
		int updateCol = memberAccompanyInfoDao.update(memberAccompanyInfo);
		
		if(updateCol>0){
			model.addAttribute("url","member/acc-setting");
			model.addAttribute("msg","수정이 완료되었습니다.");
		}
		else{
			model.addAttribute("url","member/acc-setting");
			model.addAttribute("msg","이미 삭제된 동행 정보입니다.");
		}
		return "inc/redirect";
		
	}
	
	
	@RequestMapping("/bookmark")
	public String bookmark(Model model){
		return "member.bookmark";
	}

	@RequestMapping(value="/profile-setting",
			method=RequestMethod.GET)
	public String profileSettingGet(Model model){
		return "member.profile-setting";
	}
	
	@RequestMapping(value="/profile-setting",
			method=RequestMethod.POST)
	public String profileSettingPost(Model model){
		return "member.profile-setting";
	}
	
	@RequestMapping(value="first-login-profile-setting",
			method=RequestMethod.GET)
	public String firstProfSetting(Model model){

		Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication().getDetails()).getMember();
		String memberId = member.getId();
		
		member = memberDao.get(memberId);
		List<Style> styleList = styleDao.getList();
		
		model.addAttribute("member",member);
		model.addAttribute("styles",styleList);
		
		return "member.firstLoginProfileSetting";
	}
	
	@RequestMapping(value="first-login-profile-setting",
			method=RequestMethod.POST)
	public String firstProfSettingPost(Model model,
			@RequestParam(value="status",defaultValue="입력된 상태가 없습니다.")String status,
			@RequestParam(value="bloodtype")String bloodtype,
			@RequestParam(value="job", defaultValue="입력 안된 직업")String job,
			@RequestParam(value="styleId", defaultValue="1")String styleId,
			@RequestParam(value="introduce",defaultValue="입력된 소개가 없습니다.")String introduce){
		Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication().getDetails()).getMember();
		String memberId = member.getId();
		
		MemberProfile memberProfile = new MemberProfile();
		
		memberProfile.setJob(job);
		memberProfile.setMemberId(memberId);
		memberProfile.setStatus(status);
		memberProfile.setBloodType(bloodtype);
		memberProfile.setIntroduce(introduce);
		memberProfile.setStyleId(styleId);
		
		int result = memberProfileDao.add(memberProfile);
		
		if(result>0){
			model.addAttribute("url", "member/main");
			model.addAttribute("msg", "동행이음에 오신 것을 환영합니다.");
			
			return "inc/redirect";
		}
		
		else{
			model.addAttribute("url", "member/first-login-profile-setting");
			model.addAttribute("msg", "등록 오류");
			
			return "inc/redirect";
			
		}
	}
}

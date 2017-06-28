package com.pitapany.web.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pitapany.web.dao.MemberDao;
import com.pitapany.web.dao.MemberProfileBoardDao;
import com.pitapany.web.dao.MemberProfileBoardReplyDao;
import com.pitapany.web.dao.MemberProfileDao;
import com.pitapany.web.entity.AccompanyBoardReply;
import com.pitapany.web.entity.Member;
import com.pitapany.web.entity.MemberProfile;
import com.pitapany.web.entity.MemberProfileBoard;
import com.pitapany.web.entity.MemberProfileBoardReply;
import com.pitapany.web.entity.OnlyProfBoardReplyView;
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
	public String homeGet(Model model, @RequestParam(value = "mId", defaultValue = "default") String memberId) {

		if (memberId.equals("default")) {
			Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication()
					.getDetails()).getMember();
			memberId = member.getId();

		}
		MemberProfile memberProfile = memberProfileDao.getByMemberId(memberId);
		String memberProfileId = memberProfile.getId();

		Member member = memberDao.get(memberId);
		List<MemberProfileBoard> boards = memberProfileBoardDao.getList(memberProfileId); // 그
																							// 사람의
																							// 보드들
																							// 가져오고..리스트로
		List<ProfHomeBoardAndReply> boardAndReplyLists = new ArrayList<ProfHomeBoardAndReply>(); // 게시판,
																									// 응답을
																									// 담아줄
																									// 객체
																									// 리스트

		// 포 이치 문 돌리고
		/*
		 * 안에서 그 보드의 아이디로 댓글을 리스트로 가져와서 멤버프로필보드 , 그 안의 댓글 리스트를 새로운 엔티티에담아준다.
		 */

		for (MemberProfileBoard m : boards) {

			// 게시판 ID로 댓글 가져오기
			List<OnlyProfBoardReplyView> replyLists = memberProfileBoardReplyDao.getReplyList(m.getId());

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
		model.addAttribute("boardAndReplyLists", boardAndReplyLists);

		// 멤버 프로필에 관한 정보
		model.addAttribute("memberProfile", memberProfile);

		// 멤버 기본정보에 관한 모델
		model.addAttribute("member", member);

		return "profile.home";
	}

	@RequestMapping(value = "home", method = RequestMethod.POST)
	public String homePost(Model model, HttpServletRequest request, HttpServletResponse response, String id,
			@RequestParam(value = "reply", defaultValue = "") String reply,
			@RequestParam(value = "isSecret", defaultValue = "0") int isSecret) {
		Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication()
				.getDetails()).getMember();
		String memberId = member.getId();

		MemberProfileBoardReply memberProfileBoardReply = new MemberProfileBoardReply();
		memberProfileBoardReply.setMemberProfileBoardId(id);
		memberProfileBoardReply.setMemberId(memberId);
		memberProfileBoardReply.setIsSecret(isSecret);
		memberProfileBoardReply.setReply(reply);

		memberProfileBoardReplyDao.add(memberProfileBoardReply);

		model.addAttribute("url", "profile/home");
		model.addAttribute("msg", "성공적으로 대에에에에엣글 등록이 완료로로로로!");

		return "inc/redirect";
	}
	
	
	@RequestMapping(value = "reg", method = RequestMethod.GET)
	public String reg(Model model) {
		Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication()
				.getDetails()).getMember();
		String memberId = member.getId();

		MemberProfile memberProfile = memberProfileDao.getByMemberId(memberId);
		String memberProfileId = memberProfile.getId();

		model.addAttribute("id", memberProfileId);

		return "profile.reg";
	}

	@RequestMapping(value = "reg", method = RequestMethod.POST)
	public String regPost(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "lat", defaultValue = "0.0") float lat,
			@RequestParam(value = "lng", defaultValue = "0.0") float lng,
			@RequestParam(value = "content", defaultValue = "작성된 내용이 없습니다.") String content,
			@RequestParam(value = "file", defaultValue = "null") MultipartFile file,
			@RequestParam(value = "place", defaultValue = "미등록 장소") String place,
			@RequestParam(value = "locality", defaultValue = "미등록 지역") String locality,
			@RequestParam(value = "country", defaultValue = "미등록 국가") String country) throws ParseException {

		MemberProfileBoard memberProfileBoard = new MemberProfileBoard();

		// 멤버데이터 받아오기
		Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication()
				.getDetails()).getMember();
		String memberId = member.getId();

		MemberProfile memberProfile = memberProfileDao.getByMemberId(memberId);

		// 멤버 아이디를 이용 해 프로필아이디를 받아오기
		String memberProfileId = memberProfile.getId();

		/*------------------------------------------------------------------*/
		if (!file.isEmpty()) {
			String path = request.getSession().getServletContext().getRealPath("/resource/upload");

			File d = new File(path);
			if (!d.exists())// 경로가 존재하지 않는다면
				d.mkdir();

			String originalFilename = file.getOriginalFilename(); // fileName.jpg
			String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
			String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg

			String rename = onlyFileName + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
			String fullPath = path + "/" + rename;

			if (!file.isEmpty()) {
				try {
					byte[] bytes = file.getBytes();
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
					stream.write(bytes);
					stream.close();
					// model.addAttribute("resultMsg", "파일을 업로드 성공!");
					System.out.println("업로드 성공");
				} catch (Exception e) {
					// model.addAttribute("resultMsg", "파일을 업로드하는 데에 실패했습니다.");
					System.out.println("업로드 실패");
				}
			} else {
				// model.addAttribute("resultMsg", "업로드할 파일을 선택해주시기 바랍니다.");
				System.out.println("업로드 파일 x");
			}

			String viewPath = "/resource/upload/";

			memberProfileBoard.setName(rename);
			memberProfileBoard.setMemberProfileId(memberProfileBoard.getId());
			memberProfileBoard.setSrc(viewPath);
		}
		memberProfileBoard.setMemberProfileId(memberProfileId);
		memberProfileBoard.setPlace(place);
		memberProfileBoard.setLocality(locality);
		memberProfileBoard.setCountry(country);
		memberProfileBoard.setContent(content);
		memberProfileBoard.setLatitude(lat);
		memberProfileBoard.setLongitude(lng);

		int add = memberProfileBoardDao.add(memberProfileBoard);

		if (add > 0) {
			model.addAttribute("url", "profile/home");
			model.addAttribute("msg", "성공적으로 SNS등록이 완료되었습니다.");
		}
		return "inc/redirect";
	}

	public String getCurrentDayTime() {
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
		return dayTime.format(new Date(time));
	}

}

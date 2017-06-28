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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonParser;
import com.pitapany.web.dao.AccompanyBoardDao;
import com.pitapany.web.dao.AccompanyBoardFileDao;
import com.pitapany.web.dao.AccompanyBoardReplyDao;
import com.pitapany.web.dao.MemberAccompanyInfoDao;
import com.pitapany.web.dao.MemberAccompanyMatchDao;
import com.pitapany.web.dao.MemberDao;
import com.pitapany.web.dao.MemberProfileDao;
import com.pitapany.web.dao.StyleDao;
import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.AccompanyBoardFile;
import com.pitapany.web.entity.AccompanyBoardReply;
import com.pitapany.web.entity.AccompanyBoardView;
import com.pitapany.web.entity.Member;
import com.pitapany.web.entity.MemberAccompanyInfo;
import com.pitapany.web.entity.MemberAccompanyInfoMatchingView;
import com.pitapany.web.entity.MemberAccompanyMatch;
import com.pitapany.web.entity.MemberProfInfoMatchingResultView;
import com.pitapany.web.entity.MemberProfile;
import com.pitapany.web.entity.OnlyAccReplyView;
import com.pitapany.web.entity.Style;
import com.pitapany.web.security.CustomWebAuthenticationDetails;

@Controller
@RequestMapping("/accompany/*")
public class AccompanyController {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private StyleDao styleDao;

	@Autowired
	private AccompanyBoardFileDao accompanyBoardFileDao;

	@Autowired
	private MemberAccompanyInfoDao memberAccomInfoDao;

	@Autowired
	private MemberProfileDao memberProfileDao;

	@Autowired
	private MemberAccompanyMatchDao memberAccompanyMatchDao;

	@Autowired
	private AccompanyBoardDao accompanyBoardDao;

	@Autowired
	private AccompanyBoardReplyDao accompanyBoardReplyDao;

	@RequestMapping(value = "matching", method = RequestMethod.GET)
	public String matching(Model model) {

		// 로그인한 회원 정보 가져오기
		Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication()
				.getDetails()).getMember();
		String memberId = member.getId();

		// 스타일 가져오기
		List<Style> list = styleDao.getList();
		model.addAttribute("styles", list);

		// ------- 본인 동행 정보 가져오기 ------
		List<MemberAccompanyInfo> tempMemAccomInfoList = memberAccomInfoDao.getList(memberId);

		int size = tempMemAccomInfoList.size();

		List<MemberAccompanyInfo> memAccomInfoList = new ArrayList<MemberAccompanyInfo>();

		int maxIndex = 0;

		// 동행 정보 최신 순으로 최대 5개 까지만 보이도록 만들기
		if (size < 5)
			maxIndex = size;
		else
			maxIndex = 5;

		for (int i = 0; i < maxIndex; i++) {
			memAccomInfoList.add(tempMemAccomInfoList.get(i));
		}

		/* ------------------매칭된 동행 정보 ----------------------- */
		List<MemberProfInfoMatchingResultView> resultList = new ArrayList<MemberProfInfoMatchingResultView>();

		// 기존 정보 + 새로 저장된 매칭 정보 가져오기
		List<MemberAccompanyMatch> memAccomMatchedList = memberAccompanyMatchDao.getByMemberId(memberId);

		for (MemberAccompanyMatch m : memAccomMatchedList) {
			System.out.println("매칭된 정보들" + m.getMemberAccompanyInfoId());
			MemberProfInfoMatchingResultView result = memberAccomInfoDao
					.getMatchingResult(m.getMemberAccompanyInfoId());
			resultList.add(result);
		}

		model.addAttribute("memberPrevMatchedList", resultList);

		model.addAttribute("memAccomInfoList", memAccomInfoList);
		model.addAttribute("size", size);

		return "accompany.matching";
	}

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detailGet(Model model, String id) {
		accompanyBoardDao.addHits(id);
		AccompanyBoardView accompanyBoard = accompanyBoardDao.getView(id);
		AccompanyBoardFile file = accompanyBoardFileDao.get(id);
		Member member = memberDao.get(accompanyBoard.getMemberId());
		MemberProfile memberProfile = memberProfileDao.getByMemberId(accompanyBoard.getMemberId());
		List<OnlyAccReplyView> reply = accompanyBoardReplyDao.getReplyList(id);
		model.addAttribute("file", file);
		model.addAttribute("accDetail", accompanyBoard);
		model.addAttribute("member", member);
		model.addAttribute("memberProfile", memberProfile);
		model.addAttribute("boardReply", reply);

		return "accompany.detail";
	}

	@RequestMapping(value = "detail", method = RequestMethod.POST)
	public String detailPost(Model model, HttpServletRequest request, HttpServletResponse response, String id,
			@RequestParam(value = "reply", defaultValue = "") String reply,
			@RequestParam(value = "isSecret", defaultValue = "0") int isSecret) {
		Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication()
				.getDetails()).getMember();
		String memberId = member.getId();

		AccompanyBoardReply accompanyBoardReply = new AccompanyBoardReply();
		accompanyBoardReply.setAccompanyBoardId(id);
		accompanyBoardReply.setMemberId(memberId);
		accompanyBoardReply.setIsSecret(isSecret);
		accompanyBoardReply.setReply(reply);

		accompanyBoardReplyDao.add(accompanyBoardReply);

		model.addAttribute("url", "accompany/detail?id=" + id);
		model.addAttribute("msg", "성공적으로 대에에에에엣글 등록이 완료로로로로!");

		return "inc/redirect";
	}

	@RequestMapping(value = "/reg", method = RequestMethod.GET)
	public String reg(Model model) {
		List<Style> stlyeList = styleDao.getList();

		model.addAttribute(stlyeList);
		return "accompany.reg";
	}

	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public String regPost(Model model, HttpServletRequest request, HttpServletResponse response,
			AccompanyBoardFile accompanyBoardFile, @RequestParam(value = "title", defaultValue = "") String title,
			@RequestParam(value = "lat", defaultValue = "0.0") float lat,
			@RequestParam(value = "lng", defaultValue = "0.0") float lng,
			@RequestParam(value = "content", defaultValue = "작성된 내용이 없습니다.") String content,
			@RequestParam(value = "style", defaultValue = "1") String styleId,
			@RequestParam(value = "file", defaultValue = "null") MultipartFile file,
			@RequestParam(value = "place", defaultValue = "미등록장소") String place,
			@RequestParam(value = "locality", defaultValue = "") String locality,
			@RequestParam(value = "country", defaultValue = "") String country,
			@RequestParam(value = "startDate", defaultValue = "1999-01-01") String sD,
			@RequestParam(value = "endDate", defaultValue = "1999-01-01") String eD) throws ParseException {

		Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication()
				.getDetails()).getMember();
		String memberId = member.getId();

		AccompanyBoard accompanyBoard = new AccompanyBoard();
		accompanyBoard.setContext(content);
		accompanyBoard.setLatitude(lat);
		accompanyBoard.setLongitude(lng);
		accompanyBoard.setTitle(title);

		java.sql.Date startDate = java.sql.Date.valueOf(sD);
		java.sql.Date endDate = java.sql.Date.valueOf(eD);

		accompanyBoard.setStartDate(startDate);
		accompanyBoard.setEndDate(endDate);

		accompanyBoard.setStyleId(styleId);
		accompanyBoard.setMemberId(memberId);

		accompanyBoard.setPlace(place);
		accompanyBoard.setLocality(locality);
		accompanyBoard.setCountry(country);

		accompanyBoardDao.add(accompanyBoard);

		model.addAttribute("url", "accompany/board");
		model.addAttribute("msg", "성공적으로 동행등록이 와...와...완료...");

		if (!file.isEmpty()) {
			String path = request.getSession().getServletContext().getRealPath("/resource/upload");

			/* String path = "WiynPrj\\resources\\upload"; */

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

			accompanyBoardFile.setName(rename);
			accompanyBoardFile.setAccompanyBoardId(accompanyBoard.getId());
			accompanyBoardFile.setSrc(viewPath);

			accompanyBoardFileDao.add(accompanyBoardFile);

		}

		return "inc/redirect";
	}

	public String getCurrentDayTime() {
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
		return dayTime.format(new Date(time));
	}

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(Model model, @RequestParam(value = "p", defaultValue = "1") int page,
			@RequestParam(value = "sty", defaultValue = "") String sty,
			@RequestParam(value = "sx", defaultValue = "4") int sx,
			@RequestParam(value = "a", defaultValue = "4") int age) {

		int count = accompanyBoardDao.count();
		int pageCount = 1;

		if (count % 6 != 0)
			pageCount = count / 6 + 1;
		else if (count % 6 == 0)
			pageCount = count / 6;

		/* 5개 단위의 페이지로 보여줌 1/2/3/4/5 */

		// prev: Start index
		// next : end index

		int prev = 0;
		int next = 0;

		if (page % 5 != 0)
			prev = (page / 5) * 5 + 1;
		else
			prev = (page / 5 - 1) * 5 + 1;

		if (pageCount - prev < 5 && pageCount - prev >= 0)
			next = pageCount;
		else {
			next = prev + 4;
		}

		/* System.out.println("page:"+page+"prev"+prev+"next:"+next); */
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);

		int minLimitPage = (page - 1) * 6;

		List<AccompanyBoardView> accompanyBoardList = accompanyBoardDao.getList(minLimitPage);

		model.addAttribute("page", page);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("accompanyBoardList", accompanyBoardList);

		List<Style> stlyeList = styleDao.getList();
		model.addAttribute("styleList", stlyeList);

		return "accompany.board";

	}

	/*-------------------사용자에게 동행 추천해주는 컨트롤러------------*/
	@RequestMapping(value = "matching-ajax-data", produces = "application/text; charset=utf8", method = RequestMethod.GET)
	@ResponseBody
	public String matchingAjaxGet(@RequestParam(value = "a", defaultValue = "") String memberAccomInfoId,
			@RequestParam(value = "sx", defaultValue = "2") int sex,
			@RequestParam(value = "min", defaultValue = "15") int minAge,
			@RequestParam(value = "max", defaultValue = "45") int maxAge,
			@RequestParam(value = "di", defaultValue = "default") String distance,
			@RequestParam(value = "sty", defaultValue = "default") String styleId) {

		Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication()
				.getDetails()).getMember();
		String memberId = member.getId();

		// 본인이 선택한 동행 정보 중에서 날짜, 장소 가져오기
		MemberAccompanyInfo memAccomInfo = memberAccomInfoDao.get(memberAccomInfoId);
		float latitude = memAccomInfo.getLatitude();
		float longitude = memAccomInfo.getLongitude();

		System.out.println(memAccomInfo.getPlace() + latitude + longitude);

		// 거리, 나이, 스타일, 성별로 조회해서 사람들 리스트 가져오기
		List<MemberAccompanyInfoMatchingView> matchedMember = new ArrayList<MemberAccompanyInfoMatchingView>();

		String sexEq, styleEq, sexString;

		// 스타일 무관인 경우
		if (styleId.equals("default")) {
			styleEq = "LIKE";
			styleId = "%%";
		} else
			styleEq = "=";

		// 거리 무관인 경우
		if (distance.equals("default"))
			distance = "50000000";

		// 성별 무관인 경우
		if (sex == 2) {
			sexEq = "LIKE";
			sexString = "%%";
		} else {
			sexEq = "=";
			sexString = String.valueOf(sex);
		}

		// 동행 매칭 정보를 거리를 기준으로 10개 가져온다.
		matchedMember = memberAccomInfoDao.getListMemberAccompanyMatching(latitude, longitude, memberId, styleEq,
				styleId, distance, sexEq, sexString, minAge, maxAge);

		// 가져온 데이터를 저장할 객체 생성
		MemberAccompanyMatch memberMatch = null;
		String resultString = "{'error': '매칭을 받으실 수 없습니다.'}";
		int count = memberDao.getMatchCount(memberId);
		boolean isNotMatched = false;
		// 결과를 담을 Result View List 생성 ( memberProf + member + memAccomInfo 조인한
		// 뷰로 매칭된 memAccomInfo ID로 조회해서 가져온다. )
		List<MemberProfInfoMatchingResultView> resultList = new ArrayList<MemberProfInfoMatchingResultView>();

		// 매치 횟수 3회를 초과하였는지 비교하기
		if (count >= 1 && matchedMember.size() > 0) {
			System.out.println(matchedMember.get(0).getId());
			// 사람들 리스트 중 제일 매칭 조건에 적합한 사람(matchedMember.get(0))을 등록해주기
			memberMatch = new MemberAccompanyMatch();
			memberMatch.setMatchedMemberId(matchedMember.get(0).getMemberId());
			memberMatch.setMemberId(memberId);
			memberMatch.setMemberAccompanyInfoId(matchedMember.get(0).getId());
			memberAccompanyMatchDao.add(memberMatch);
			memberDao.addMatchCount(memberId);

		} else if (matchedMember.size() == 0) {
			System.out.println("매칭될 사람이 없음..");
			resultString = "{\"error\":\"검색 결과가 없습니다.\"}";
			isNotMatched = true;
		} else if (count < 1) {
			System.out.println("카운트 횟수 초과");
			resultString = "{\"error\":\"하루 매칭 최대 횟수를 초과하였습니다.\"}";
			isNotMatched = true;
		}

		// 기존 정보 + 새로 저장된 매칭 정보 가져오기
		List<MemberAccompanyMatch> memAccomMatchedList = memberAccompanyMatchDao.getByMemberId(memberId);

		for (MemberAccompanyMatch m : memAccomMatchedList) {
			System.out.println("매칭된 정보들" + m.getMemberAccompanyInfoId());
			MemberProfInfoMatchingResultView result = memberAccomInfoDao
					.getMatchingResult(m.getMemberAccompanyInfoId());
			resultList.add(result);
		}

		String json = null;
		Gson gson = new Gson();
		JsonParser parser = new JsonParser();

		if (!isNotMatched) {
			json = gson.toJson(resultList);
			System.out.println("json" + json);
			return json;
		} else {
			System.out.println(resultString);
			return resultString;
		}

	}

}
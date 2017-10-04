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
	
	private String pla;
	private String sty;
	private int min_a;
	private int max_a;
	private String lat;
	private String lng;
	private String sD;
	private String eD;

	@RequestMapping(value = "matching", method = RequestMethod.GET)
	public String matching(@RequestParam(value="id", defaultValue="default")String memberAccomInfoId,
			Model model) {

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

		/* ------------------매칭된 동행 정보(전체) ----------------------- */
		List<MemberProfInfoMatchingResultView> resultList = new ArrayList<MemberProfInfoMatchingResultView>();

		// 매칭 당일 새로 저장된 매칭 정보 가져오기
		List<MemberAccompanyMatch> memAccomMatchedList = memberAccompanyMatchDao.getByMemberId(memberId);

		for (MemberAccompanyMatch m : memAccomMatchedList) {
			MemberProfInfoMatchingResultView result = memberAccomInfoDao
					.getMatchingResult(m.getMemberAccompanyInfoId());
			resultList.add(result);
		}
		
		/* ------------------매칭된 동행 정보(당일날 매칭된 정보) ----------------------- */
		List<MemberProfInfoMatchingResultView> resultListToday = new ArrayList<MemberProfInfoMatchingResultView>();
		
		// 매칭 당일 새로 저장된 매칭 정보 가져오기
		List<MemberAccompanyMatch> memAccomMatchedListToday = memberAccompanyMatchDao.getByMemberIdToday(memberId);
		
		for (MemberAccompanyMatch m : memAccomMatchedListToday) {
			MemberProfInfoMatchingResultView result = memberAccomInfoDao
					.getMatchingResult(m.getMemberAccompanyInfoId());
			resultListToday.add(result);
		}

		
		/*---------------기존 매칭 정보 선택 시 해당 정보 가져오기-------------------*/ 
		MemberProfInfoMatchingResultView selectMatchedInfo = null;
		
		if(!memberAccomInfoId.equals("default"))
			selectMatchedInfo = memberAccomInfoDao.getMatchingResult(memberAccomInfoId);

		

		
		//남은 매칭 횟수
		String matchCount = memberDao.getMember(memberId).getMatchCount();

		model.addAttribute("memberPrevMatchedList", resultList);
		model.addAttribute("memberPrevMatchedListToday", resultListToday);
		model.addAttribute("memberPrevSelected",selectMatchedInfo);
		model.addAttribute("memAccomInfoList", memAccomInfoList);
		model.addAttribute("size", size);
		model.addAttribute("memberAccomInfoId", memberAccomInfoId);
		model.addAttribute("matchCount", matchCount);
		

		return "accompany.matching";
	}

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detailGet(Model model, 
			String id,
			@RequestParam(value = "sty", defaultValue = "default") String sty,
			@RequestParam(value = "sx", defaultValue = "default") String sx,
			@RequestParam(value = "min_a", defaultValue = "0") int min_a,
			@RequestParam(value = "max_a", defaultValue = "100") int max_a,
			@RequestParam(value = "lat", defaultValue = "0") String lat,
			@RequestParam(value = "lng", defaultValue = "0") String lng,
			@RequestParam(value = "sD", defaultValue = "0000-00-00") String sD,
			@RequestParam(value = "eD", defaultValue = "9999-99-99") String eD,
			@RequestParam(value = "pla", defaultValue = "default") String pla,
			@RequestParam(value = "p", defaultValue = "1") String page) {
		
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
		model.addAttribute("page", page);
		model.addAttribute("pla",pla);
		model.addAttribute("sty",sty);
		model.addAttribute("min_a",min_a);
		model.addAttribute("max_a",max_a);
		model.addAttribute("lat",lat);
		model.addAttribute("lng",lng);
		model.addAttribute("sD",sD);
		model.addAttribute("eD",eD);
		
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
	
	@RequestMapping(value = "detail-delete", method = RequestMethod.GET)
	public String detaiDelete(Model model, HttpServletRequest request, HttpServletResponse response,
			String id) {
		
		accompanyBoardDao.delete(id);

		model.addAttribute("url", "accompany/board");
		model.addAttribute("msg", "삭제되었습니다.");

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
			@RequestParam(value = "title", defaultValue = "") String title,
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
		model.addAttribute("msg", "성공적으로 동행등록이 완료되었습니다.");

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
			
			AccompanyBoardFile accompanyBoardFile = new AccompanyBoardFile();

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
	
	@RequestMapping(value = "detail-edit", method = RequestMethod.GET)
	public String detailEditGet(Model model, String id, String pla, String sty, int min_a, int max_a, String lat,String lng,String sD, String eD,
			String p) {
		List<Style> stlyeList = styleDao.getList();
		AccompanyBoardView accompanyBoardView = accompanyBoardDao.getView(id);
		model.addAttribute("accDetail", accompanyBoardView);
		
		model.addAttribute(stlyeList);
		model.addAttribute("page",p);
		
		this.pla = pla;
		this.sty = sty;
		this.min_a = min_a;
		this.max_a = max_a;
		this.lat = lat;
		this.lng = lng;
		this.sD = sD;
		this.eD = eD;
		
		return "accompany.detail-edit";
	}
	
	@RequestMapping(value = "detail-edit", method = RequestMethod.POST)
	public String detailEditPost(Model model, HttpServletRequest request, HttpServletResponse response,
			String id,
			@RequestParam(value = "page", defaultValue = "1") String page,
			@RequestParam(value = "title", defaultValue = "default") String title,
			@RequestParam(value = "lat", defaultValue = "0.0") float lat,
			@RequestParam(value = "lng", defaultValue = "0.0") float lng,
			@RequestParam(value = "content", defaultValue = "default") String content,
			@RequestParam(value = "style", defaultValue = "default") String styleId,
			@RequestParam(value = "file", defaultValue = "") MultipartFile file,
			@RequestParam(value = "place", defaultValue = "default") String place,
			@RequestParam(value = "locality", defaultValue = "default") String locality,
			@RequestParam(value = "country", defaultValue = "default") String country,
			@RequestParam(value = "startDate", defaultValue = "default") String sD,
			@RequestParam(value = "endDate", defaultValue = "default") String eD) throws ParseException {

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
		accompanyBoard.setId(id);
		
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

			AccompanyBoardFile accompanyBoardFile = new AccompanyBoardFile();
			
			accompanyBoardFile.setName(rename);
			accompanyBoardFile.setAccompanyBoardId(accompanyBoard.getId());
			accompanyBoardFile.setSrc(viewPath);
			accompanyBoardFile.setId(id);
			
			accompanyBoardFileDao.update(accompanyBoardFile);

		}

		int result = accompanyBoardDao.update(accompanyBoard);

		if(result>0)
			model.addAttribute("msg", "수정되었습니다.");
		else
			model.addAttribute("msg", "수정 과정에 오류가 발생했습니다. 관리자에게 문의해주세요.");
		
		model.addAttribute("url", "accompany/detail?id="+id+"&p="+page+
				"&pla="+this.pla+"&sty="+this.sty+"&min_a="+this.min_a+"&max_a="+this.max_a+"&lat="+this.lat+"&lng="+this.lng+"&sD="+this.sD+"&eD="+this.eD);

		return "inc/redirect";
	}

	/*-----------------------------ACCOMPANY/BOARD----------------------------------------------*/
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(Model model, @RequestParam(value = "p", defaultValue = "1") int page,
			@RequestParam(value = "sty", defaultValue = "default") String sty,
			@RequestParam(value = "sx", defaultValue = "default") String sx,
			@RequestParam(value = "min_a", defaultValue = "0") int minAge,
			@RequestParam(value = "max_a", defaultValue = "100") int maxAge,
			@RequestParam(value = "lat", defaultValue = "0") String latitude,
			@RequestParam(value = "lng", defaultValue = "0") String longitude,
			@RequestParam(value = "sD", defaultValue = "0000-00-00") String startDate,
			@RequestParam(value = "eD", defaultValue = "9999-99-99") String endDate,
			@RequestParam(value = "pla", defaultValue = "default") String place) {

		/*--------------style 미지정 시 default값 설정해주기---------------*/
		String styleComp = null;
		String styleId = null;
		String sex = null;

		if(sty.equals("default")){
			styleId = "%%";
			styleComp = "LIKE";
		}
		else{ 
			styleId = sty;
			styleComp = "=";
		}
		/*----------------------sex 미지정시 default값 설정 -------------*/
		/*---------3-필터 없음 4-성별 무관----------------*/
		if(sx.equals("default") || sx.equals("3"))
			sex = "%%";
		else
			sex = sx;
		
		
	
		/*------------검색 결과 갯수 가져오기------------*/
		
		int count;
		//날짜, 위치로 검색한 경우
		if(!latitude.equals("0") && !startDate.equals("0000-00-00"))
			count = accompanyBoardDao.countByLocationDate(latitude, longitude, startDate, endDate, styleComp, styleId, minAge, maxAge, sex);

		//날짜, 위치 검색하지 않고, 스타일 성별 나이 검색 옵션 이용하는 경우
		else if(latitude.equals("0") && startDate.equals("0000-00-00") && ( !sty.equals("default") || !sx.equals("default") || maxAge!=100)){
			count = accompanyBoardDao.countBySexAgeStyle(styleComp, styleId, minAge, maxAge, sex);
		}
		// 검색 옵션 없이, 초기 페이지를 요청한 경우
		else
			count = accompanyBoardDao.count();
		
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

		model.addAttribute("page", page);
		model.addAttribute("pageCount", pageCount);

		/* ------------------ 검색 필터를 이용한 동행 게시판 목록 가져오기  ----------- */
		List<AccompanyBoardView> accompanyBoardList = null;
		
		
		//날짜, 주소 검색와 스타일, 나이, 성별 필터 모두 적용
		if(!latitude.equals("0") && !startDate.equals("0000-00-00")){
			accompanyBoardList = accompanyBoardDao.getListByLocationDate(latitude, longitude, startDate, endDate, minLimitPage, styleComp, styleId, minAge, maxAge, sex);
		}
		// 날짜, 주소 검색 없이, 스타일, 나이, 성별 필터만 적용
		else if(latitude.equals("0") && startDate.equals("0000-00-00") && ( !sty.equals("default") || !sx.equals("default") || maxAge!=100 )){
			accompanyBoardList = accompanyBoardDao.getListBySexAgeStyle(styleComp, styleId, minAge, maxAge, sex, minLimitPage);

		}
		// 아무런 필터 없이 페이지만 요청한 경우
		else{
			accompanyBoardList = accompanyBoardDao.getList(minLimitPage);			
		}
		
		if(accompanyBoardList.isEmpty()){
			model.addAttribute("msg","검색된 결과가 없습니다.");
			return "inc/goBack";
		}
		
		model.addAttribute("accompanyBoardList", accompanyBoardList);
		model.addAttribute("lat", latitude);
		model.addAttribute("lng", longitude);
		model.addAttribute("sD", startDate);
		model.addAttribute("eD", endDate);
		model.addAttribute("sx", sx);	
		model.addAttribute("sty", sty);	
		model.addAttribute("min_a", minAge);	
		model.addAttribute("max_a", maxAge);
		model.addAttribute("pla", place);	
		

		List<Style> stlyeList = styleDao.getList();
		model.addAttribute("styleList", stlyeList);

		return "accompany.board";

	}
	
	/*-----------------------------------------------------------------------------------------*/

	
	
	/*-------------------AJAX 동행 매칭 부분------------*/
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


		// 거리, 나이, 스타일, 성별로 조회해서 사람들 리스트 가져오기
		List<MemberAccompanyInfoMatchingView> matchedMember = new ArrayList<MemberAccompanyInfoMatchingView>();

		String sexEq, styleEq, sexString;

		// 스타일 무관인 경우
		if (styleId.equals("default")) {
			styleEq = "LIKE";
			styleId = "%%";
		} else if(styleId.contains(" ")) {
			styleEq = "!=";
			
			if(!styleId.contains("1")) {
				styleId = "1";
			}
			else if(!styleId.contains("2")) {
				styleId = "2";
			}
			else {
				styleId = "3";
			}
		}
		else {
			styleEq = "=";
		}
		System.out.println(styleEq);
			

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

		// 동행 매칭 정보를 거리를 기준으로 100개 가져온다.
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

		System.out.println(count);
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

		} else if (count < 1) {
			System.out.println("카운트 횟수 초과");
			resultString = "{\"error\":\"하루 매칭 최대 횟수를 초과하였습니다.\"}";
			isNotMatched = true;
		}
		else if (matchedMember.size() == 0) {
			System.out.println("매칭될 사람이 없음..");
			resultString = "{\"error\":\"검색 결과가 없습니다.\"}";
			isNotMatched = true;
		} 

		// 기존 정보 + 새로 저장된 매칭 정보 가져오기
		List<MemberAccompanyMatch> memAccomMatchedList = memberAccompanyMatchDao.getByMemberIdToday(memberId);

		for (MemberAccompanyMatch m : memAccomMatchedList) {
			MemberProfInfoMatchingResultView result = memberAccomInfoDao
					.getMatchingResult(m.getMemberAccompanyInfoId());
			resultList.add(result);
		}

		
		String json = null;
		Gson gson = new Gson();

		if (!isNotMatched) {
			json = gson.toJson(resultList);
//			gson.toJson(json, memberDao.getMember(memberId).getMatchCount()));
			System.out.println("json" + json);
			return json;
		} else {
			System.out.println(resultString);
			return resultString;
		}

	}
/*	
	---------------------------- 이전 동행 매칭 정보 ajax 로 가져오기 -----------------
	@RequestMapping(value = "prev-matched-ajax-data", produces = "application/text; charset=utf8", method = RequestMethod.GET)
	@ResponseBody
	public String prevMatchedGet(){

		Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication()
				.getDetails()).getMember();
		String memberId = member.getId();
		
		// 기존 정보 + 새로 저장된 매칭 정보 가져오기
		List<MemberAccompanyMatch> memAccomMatchedList = memberAccompanyMatchDao.getByMemberId(memberId);
		List<MemberProfInfoMatchingResultView> resultList = new ArrayList<MemberProfInfoMatchingResultView>();
		
		for (MemberAccompanyMatch m : memAccomMatchedList) {
			MemberProfInfoMatchingResultView result = memberAccomInfoDao
					.getMatchingResult(m.getMemberAccompanyInfoId());
			resultList.add(result);
		}

		
		String json = null;
		Gson gson = new Gson();
		JsonParser parser = new JsonParser();
		
		if(resultList.isEmpty()) {
			String resultString = "{\"error\":\"이전 동행 정보가 없습니다.\"}";
			return resultString;
		}
		else {	
			json = gson.toJson(resultList);
			return json;
		}
		
	}
	*/

}
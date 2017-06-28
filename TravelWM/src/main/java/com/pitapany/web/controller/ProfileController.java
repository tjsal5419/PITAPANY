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
		List<MemberProfileBoard> boards = memberProfileBoardDao.getList(memberProfileId); // ��
																							// �����
																							// �����
																							// ��������..����Ʈ��
		List<ProfHomeBoardAndReply> boardAndReplyLists = new ArrayList<ProfHomeBoardAndReply>(); // �Խ���,
																									// ������
																									// �����
																									// ��ü
																									// ����Ʈ

		// �� ��ġ �� ������
		/*
		 * �ȿ��� �� ������ ���̵�� ����� ����Ʈ�� �����ͼ� ��������ʺ��� , �� ���� ��� ����Ʈ�� ���ο� ��ƼƼ������ش�.
		 */

		for (MemberProfileBoard m : boards) {

			// �Խ��� ID�� ��� ��������
			List<OnlyProfBoardReplyView> replyLists = memberProfileBoardReplyDao.getReplyList(m.getId());

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
		model.addAttribute("boardAndReplyLists", boardAndReplyLists);

		// ��� �����ʿ� ���� ����
		model.addAttribute("memberProfile", memberProfile);

		// ��� �⺻������ ���� ��
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
		model.addAttribute("msg", "���������� �뿡���������� ����� �Ϸ�ηηη�!");

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
			@RequestParam(value = "content", defaultValue = "�ۼ��� ������ �����ϴ�.") String content,
			@RequestParam(value = "file", defaultValue = "null") MultipartFile file,
			@RequestParam(value = "place", defaultValue = "�̵�� ���") String place,
			@RequestParam(value = "locality", defaultValue = "�̵�� ����") String locality,
			@RequestParam(value = "country", defaultValue = "�̵�� ����") String country) throws ParseException {

		MemberProfileBoard memberProfileBoard = new MemberProfileBoard();

		// ��������� �޾ƿ���
		Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication()
				.getDetails()).getMember();
		String memberId = member.getId();

		MemberProfile memberProfile = memberProfileDao.getByMemberId(memberId);

		// ��� ���̵� �̿� �� �����ʾ��̵� �޾ƿ���
		String memberProfileId = memberProfile.getId();

		/*------------------------------------------------------------------*/
		if (!file.isEmpty()) {
			String path = request.getSession().getServletContext().getRealPath("/resource/upload");

			File d = new File(path);
			if (!d.exists())// ��ΰ� �������� �ʴ´ٸ�
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
					// model.addAttribute("resultMsg", "������ ���ε� ����!");
					System.out.println("���ε� ����");
				} catch (Exception e) {
					// model.addAttribute("resultMsg", "������ ���ε��ϴ� ���� �����߽��ϴ�.");
					System.out.println("���ε� ����");
				}
			} else {
				// model.addAttribute("resultMsg", "���ε��� ������ �������ֽñ� �ٶ��ϴ�.");
				System.out.println("���ε� ���� x");
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
			model.addAttribute("msg", "���������� SNS����� �Ϸ�Ǿ����ϴ�.");
		}
		return "inc/redirect";
	}

	public String getCurrentDayTime() {
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
		return dayTime.format(new Date(time));
	}

}

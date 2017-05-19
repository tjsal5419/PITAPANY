package com.pitapany.web.controller;

import java.security.Principal;
import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pitapany.web.dao.MemberDao;
import com.pitapany.web.entity.Member;

@Controller
@RequestMapping("/joinus/*")
public class JoinusController {

	@Autowired
	MemberDao memberDao;
	
	@RequestMapping("login")
	public String login() {
		return "joinus/login";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login";
	}
	
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String join() {
		return "joinus/join";
	}
	
	@RequestMapping(value="join", 
			method=RequestMethod.POST, 
			produces="text/plain;charset=UTF-8")
	public String signup(String email, String pwd, String name, int sex, Date birthday, String phone){
		if(memberDao.getSizeByEmail(email)>0){
			return "joinus.join"; //이미  가입된 경우
		}
		else{
			Member member = new Member();
			member.setEmail(email);
			member.setPassword(pwd);
			member.setName(name);
			member.setSex(sex);
			member.setBirthday(birthday);
			member.setPhone(phone);
			memberDao.add(member);
			
			return "index";
		}
	}
	
	@RequestMapping("mainpage")
	public String mainpage(Principal principal) {
		String memberId = principal.getName();
		
		String role = "ROLE_USER";
		
		if(role.equals("ROLE_USER"))
			return "redirect:/member/mainpage";
		else
			return "redirect:/member/mainpage";	
	}
}

package com.pitapany.web.controller;

import java.security.Principal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pitapany.web.dao.MemberDao;
import com.pitapany.web.entity.Member;

@Controller
@RequestMapping("/joinus/*")
public class JoinusController {

	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping("login")
	public String login(Model model, @RequestParam(value="e", defaultValue="0")String error) {
		model.addAttribute("error",error);
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
	public String signup(String email, String password, String name, int sex, String year, String month, String day, String phone,String nicName) throws ParseException{
		if(memberDao.getSizeByEmail(email)>0){
			return "joinus/join"; //이미  가입된 경우
		}
		else{
			String date = year+"-"+month+"-"+day;
			Date birthday = Date.valueOf(date);
			System.out.println(birthday);
			Member member = new Member();
			System.out.println(email);
			member.setEmail(email);
			member.setPassword(password);
			member.setName(name);
			member.setSex(sex);
			member.setBirthday(birthday);
			member.setPhone(phone);
			member.setNicName(nicName);
			memberDao.add(member);
			
			return "joinus/loginSuccess";
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
	
	@RequestMapping("duplicated-login")
	public String duplicated(){
		return "joinus/login-duplicate";
	}
}

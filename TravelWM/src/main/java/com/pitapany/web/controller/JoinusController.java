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
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pitapany.web.dao.MemberDao;
import com.pitapany.web.entity.Member;
import com.pitapany.web.security.BcryptPasswordEncoding;

@Controller
@RequestMapping("/joinus/*")
public class JoinusController {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BcryptPasswordEncoding bcryptPasswordEncoder;
	
	@RequestMapping(value="login", 
			method=RequestMethod.GET)
	public String login2(Model model, @RequestParam(value="e", defaultValue="0")String error) {
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
	
	@RequestMapping(value="login", 
			method=RequestMethod.POST, 
			produces="text/plain;charset=UTF-8")
	public String signup(String email, String password, String name, int sex, String year, String month, String day, String phone,String nicName) throws ParseException{
		if(memberDao.getSizeByEmail(email)>0){
			return "redirect:joinus/login?e=2"; //占싱뱄옙  占쏙옙占쌉듸옙 占쏙옙占�
		}
		else{
			String date = year+"-"+month+"-"+day;
			Date birthday = Date.valueOf(date);
			Member member = new Member();
			System.out.println(email);
			
			String encodedPassword = bcryptPasswordEncoder.encode(password);
			
			member.setEmail(email);
			System.out.println(encodedPassword);
			
			member.setPassword(encodedPassword);
			member.setName(name);
			member.setSex(sex);
			member.setBirthday(birthday);
			member.setPhone(phone);
			member.setNicName(nicName);
			memberDao.add(member);
			return "redirect:login";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="login-member-check")
	public String MemberCheck(@RequestParam(value="e", defaultValue="0")String email){
		Member member = memberDao.getByEmail(email);
		Gson gson = new Gson();
		String json=null;
		json = gson.toJson(member);
		
		return json;
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
	
	@RequestMapping("expiredLogin")
	public String expiredLogin(){
		return "joinus/expiredLogin";
	}	
}

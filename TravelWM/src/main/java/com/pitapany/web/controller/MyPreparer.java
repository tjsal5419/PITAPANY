package com.pitapany.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.pitapany.web.dao.MemberDao;
import com.pitapany.web.entity.Member;

public class MyPreparer implements ViewPreparer{

	@Autowired
	private MemberDao memberDao;

	   
	@Override
	public void execute(Request tilesRequest, AttributeContext context) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if(!auth.isAuthenticated()){
			System.out.println("로그인 세션 만료");
		}
		else{
		String name = auth.getName(); //get logged in username
		
		Member member = memberDao.get(memberDao.getIdByEmail(name));
		tilesRequest.getContext("request").put("m",member);
		}
	}

}

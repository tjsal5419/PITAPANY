package com.pitapany.web.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import com.pitapany.web.dao.MemberDao;
import com.pitapany.web.dao.mybatis.MybatisMemberDao;
import com.pitapany.web.entity.Member;

public class CustomWebAuthenticationDetails extends WebAuthenticationDetails {

    private final Member member;

    @Autowired
    private MemberDao memberDao;
   
    
    public CustomWebAuthenticationDetails(HttpServletRequest request) {
        super(request);

        String email = request.getParameter("j_username");
        System.out.println(email);
        
        SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
        System.out.println("아이디는"+memberDao.getIdByEmail(email));
        
        Member member = memberDao.get(memberDao.getIdByEmail(email));
        memberDao.updateAgeAll();
        this.member = member;
        

        
    }

    public Member getMember() {
        return member;
    }
    
    

}
package com.pitapany.web.security;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.pitapany.web.dao.MemberDao;
import com.pitapany.web.entity.Member;

public class LoginAuthenticationProvider implements AuthenticationProvider{
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BcryptPasswordEncoding encoding;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String email = authentication.getName();
		String password = (String)authentication.getCredentials();
		
		Member member = memberDao.getByEmail(email);
		
		if(member!=null){
			String encodedPassword = member.getPassword();
			CharSequence passwordChar = password;
			
			if(encoding.matches(passwordChar, encodedPassword)){
				List<GrantedAuthority> grantedAuths = new ArrayList<>();	
		        grantedAuths.add(new SimpleGrantedAuthority("ROLE_USER")); // 권한 임시 ROLE_USER 지정
		        
				return new UsernamePasswordAuthenticationToken(email, password, grantedAuths);
			}
			else
				throw new BadCredentialsException( "암호가 일치하지 않습니다." );
		}
		
		return null;

	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}

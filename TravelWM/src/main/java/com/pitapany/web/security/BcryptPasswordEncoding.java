package com.pitapany.web.security;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class BcryptPasswordEncoding implements PasswordEncoder {
	private PasswordEncoder passwordEncoder;
	
	public BcryptPasswordEncoding(){
		this.passwordEncoder = new BCryptPasswordEncoder();
	}
	
	public BcryptPasswordEncoding(PasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	public String encode(CharSequence rawPassword) {
		return passwordEncoder.encode(rawPassword);
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		return passwordEncoder.matches(rawPassword, encodedPassword);
	}

	

}

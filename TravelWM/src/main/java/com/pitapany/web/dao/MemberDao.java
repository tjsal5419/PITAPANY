package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.Member;

public interface MemberDao {
	Member get(String id);
	Member getMember(String id);
	List<Member> getList();
	String getIdByEmail(String email);
	int getSizeByEmail(String email);

	int delete(String id);
	int add(Member member);
	int update(Member member);
	
}

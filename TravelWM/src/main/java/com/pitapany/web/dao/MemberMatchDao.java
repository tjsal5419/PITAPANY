package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.MemberMatch;

public interface MemberMatchDao {
	MemberMatch get(String id);
	List<MemberMatch> getList();
	
	int delete(String id);
	int add(MemberMatch memberMatch);
	int update(MemberMatch memberMatch);
}

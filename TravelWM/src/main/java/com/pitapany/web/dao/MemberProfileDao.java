package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.MemberProfile;

public interface MemberProfileDao {
	MemberProfile get(String id);
	List<MemberProfile> getList();
	MemberProfile getByMemberId(String memberId);	
	
	int isRegisterd(String memberId);
	int delete(String id);
	int add(MemberProfile memberProfile);
	int update(MemberProfile memberProfile);
}

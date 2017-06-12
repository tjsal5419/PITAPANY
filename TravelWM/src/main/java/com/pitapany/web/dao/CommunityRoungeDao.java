package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.CommunityRounge;
import com.pitapany.web.entity.Member;

public interface CommunityRoungeDao {
	CommunityRounge get(String id);
	List<CommunityRounge> getList();

	int delete(String id);
	int add(CommunityRounge communityRounge);
	int update(CommunityRounge communityRounge);
	
}

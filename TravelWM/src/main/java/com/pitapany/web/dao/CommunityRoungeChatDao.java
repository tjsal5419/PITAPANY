package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.CommunityRounge;
import com.pitapany.web.entity.CommunityRoungeChat;
import com.pitapany.web.entity.Member;

public interface CommunityRoungeChatDao {
	CommunityRoungeChat get(String id);
	List<CommunityRoungeChat> getList();

	int delete(String id);
	int add(CommunityRoungeChat communityRoungeChat);
	int update(CommunityRoungeChat communityRoungeChat);
	
}

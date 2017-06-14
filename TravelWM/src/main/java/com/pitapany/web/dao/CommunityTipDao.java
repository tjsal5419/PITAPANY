package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.CommunityRounge;
import com.pitapany.web.entity.CommunityTip;
import com.pitapany.web.entity.CommunityTipView;
import com.pitapany.web.entity.Member;

public interface CommunityTipDao {
	CommunityTipView get(String id);
	List<CommunityTipView> getList(int page, String field, String query, String category);
	
	int count(String field, String query, String category);
	int delete(String id);
	int add(CommunityTip communityTip);
	int update(CommunityTip communityTip);
	int addHits(String id);
}

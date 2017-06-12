package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.CommunityRounge;
import com.pitapany.web.entity.CommunityTip;
import com.pitapany.web.entity.CommunityTipView;
import com.pitapany.web.entity.Member;
import com.pitapany.web.entity.TipCategory;

public interface TipCategoryDao {
	TipCategory get(String id);
	List<TipCategory> getList();

	int delete(String id);
	int add(TipCategory communityTip);
	int update(TipCategory communityTip);
	
}

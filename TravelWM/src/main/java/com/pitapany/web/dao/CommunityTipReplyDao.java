package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.AccompanyBoardReply;
import com.pitapany.web.entity.CommunityTipReply;
import com.pitapany.web.entity.OnlyTipReplyView;

public interface CommunityTipReplyDao {
	CommunityTipReply get(String id);
	List<CommunityTipReply> getList(String id);
	List<OnlyTipReplyView> getReplyList(String id);
	
	int delete(String id);
	int add(CommunityTipReply communityTipReply);
	int update(CommunityTipReply communityTipReply);
}

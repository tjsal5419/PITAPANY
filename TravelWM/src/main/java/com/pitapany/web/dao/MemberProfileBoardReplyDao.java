package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.MemberProfileBoardReply;
import com.pitapany.web.entity.OnlyProfBoardReplyView;

public interface MemberProfileBoardReplyDao {
	MemberProfileBoardReply get(String id);

	List<MemberProfileBoardReply> getList(String memberProfileBoardId);
	List<OnlyProfBoardReplyView> getReplyList(String memberProfileBoardId);
	
	int count();

	int delete(String id);

	int add(MemberProfileBoardReply memberProfileBoardReply);

	int update(MemberProfileBoardReply memberProfileBoardReply);
}

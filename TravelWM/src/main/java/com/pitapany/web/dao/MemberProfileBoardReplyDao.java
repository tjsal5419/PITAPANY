package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.MemberProfileBoardReply;

public interface MemberProfileBoardReplyDao {
	MemberProfileBoardReply get(String id);

	List<MemberProfileBoardReply> getList();

	int count();

	int delete(String id);

	int add(MemberProfileBoardReply memberProfileBoardReply);

	int update(MemberProfileBoardReply memberProfileBoardReply);
}

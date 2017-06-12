package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.AccompanyBoardReply;

public interface AccompanyBoardReplyDao {
	AccompanyBoardReply get(String id);
	List<AccompanyBoardReply> getList();
	
	int delete(String id);
	int add(AccompanyBoardReply accompanyBoardReply);
	int update(AccompanyBoardReply accompanyBoardReply);
}

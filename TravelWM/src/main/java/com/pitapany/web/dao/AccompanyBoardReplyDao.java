package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.AccompanyBoardReply;
import com.pitapany.web.entity.OnlyAccReplyView;

public interface AccompanyBoardReplyDao {
	AccompanyBoardReply get(String id);
	List<AccompanyBoardReply> getList(String id);
	List<OnlyAccReplyView> getReplyList(String id);
	
	int delete(String id);
	int add(AccompanyBoardReply accompanyBoardReply);
	int update(AccompanyBoardReply accompanyBoardReply);
}

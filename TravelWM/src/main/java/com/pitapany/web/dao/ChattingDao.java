package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.Chatting;

public interface ChattingDao {
	Chatting get(String id);
	List<Chatting> getList();
	
	int delete(String id);
	int add(Chatting chatting);
	int update(Chatting chatting);
}

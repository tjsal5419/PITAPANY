package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.AccompanyBoard;

public interface AccompanyBoardDao {
	AccompanyBoard get(String id);
	List<AccompanyBoard> getList(int page);
	
	int count();
	int addHits(String id);
	int delete(String id);
	int add(AccompanyBoard accompanyBoard);
	int update(AccompanyBoard accompanyBoard);
}

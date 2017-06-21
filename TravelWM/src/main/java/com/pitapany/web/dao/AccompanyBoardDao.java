package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.AccompanyBoardView;

public interface AccompanyBoardDao {
	AccompanyBoard get(String id);
	List<AccompanyBoardView> getList(int page);
	List<AccompanyBoardView> getMainList();
	
	int count();
	int addHits(String id);
	int delete(String id);
	int add(AccompanyBoard accompanyBoard);
	int update(AccompanyBoard accompanyBoard);
}

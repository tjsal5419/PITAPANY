package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.MemberAccompanyBoardBookmark;
import com.pitapany.web.entity.TipCategory;


public interface MemberAccompanyBoardBookmarkDao {
	MemberAccompanyBoardBookmark get(String id);
	List<MemberAccompanyBoardBookmark> getList(int page);
	
	int count();
	int delete(String id);
	int add(MemberAccompanyBoardBookmark MemberAccompanyBoardBookmark);
	
}

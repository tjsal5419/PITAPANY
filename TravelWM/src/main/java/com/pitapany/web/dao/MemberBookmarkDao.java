package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.MemberBookmark;

public interface MemberBookmarkDao {
	MemberBookmark get(String id);
	List<MemberBookmark> getList(int page);
	
	int count();
	int delete(String id);
	int add(MemberBookmark memberBookmark);
}

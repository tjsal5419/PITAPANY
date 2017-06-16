package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.MemberRoungeBookmark;

public interface MemberRoungeBookmarkDao {
	MemberRoungeBookmark get(String id);
	List<MemberRoungeBookmark> getList();
	
	int delete(String id);
	int add(MemberRoungeBookmark memberRoungeBookmark);
	int update(MemberRoungeBookmark memberRoungeBookmark);
}

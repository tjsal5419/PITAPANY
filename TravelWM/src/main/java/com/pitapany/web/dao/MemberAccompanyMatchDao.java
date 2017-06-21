package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.MemberAccompanyMatch;

public interface MemberAccompanyMatchDao {
	MemberAccompanyMatch get(String id);
	List<MemberAccompanyMatch> getList(int page);
	
	int count();
	int delete(String id);
	int add(MemberAccompanyMatch memberAccompanyMatch);
}

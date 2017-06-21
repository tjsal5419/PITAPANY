package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.MemberAccompanyInfo;

public interface MemberAccompanyInfoDao {
	MemberAccompanyInfo get(String id);
	List<MemberAccompanyInfo> getList(int page);
	
	int count();
	int delete(String id);
	int add(MemberAccompanyInfo memberAccompanyInfo);
	int update(MemberAccompanyInfo memberAccompanyInfo);
}

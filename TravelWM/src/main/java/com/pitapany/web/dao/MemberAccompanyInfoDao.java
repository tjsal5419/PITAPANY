package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.MemberAccompanyInfo;
import com.pitapany.web.entity.MemberAccompanyInfoMatchingView;
import com.pitapany.web.entity.MemberProfInfoMatchingResultView;

public interface MemberAccompanyInfoDao {
	MemberAccompanyInfo get(String id);
	List<MemberAccompanyInfo> getList(String memberId);
	
	List<MemberAccompanyInfoMatchingView> getListMemberAccompanyMatching(float latitude, float longitude, String memberId, String styleEq, String styleId, String distance, String sexEq, String sex, int minAge, int maxAge);
	
	MemberProfInfoMatchingResultView getMatchingResult(String memberAccomInfoId);
	
	int count();
	int delete(String id);
	int add(MemberAccompanyInfo memberAccompanyInfo);
	int update(MemberAccompanyInfo memberAccompanyInfo);
}

package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.MatchedMemberView;
import com.pitapany.web.entity.MemberAccompanyMatch;
import com.pitapany.web.entity.MemberProfInfoMatchingResultView;

public interface MemberAccompanyMatchDao {
	MemberAccompanyMatch get(String id);
	List<MemberAccompanyMatch> getList(int page);
	List<MemberAccompanyMatch> getByMemberId(String memberId);
	List<MemberAccompanyMatch> getByMemberIdToday(String memberId);
	List<MatchedMemberView> getMatchedMemberList(String memberId);
	
	int count();
	int delete(String id);
	int deleteByAccomInfoId(String memberAccompanyInfoId);
	
	int add(MemberAccompanyMatch memberAccompanyMatch);
}

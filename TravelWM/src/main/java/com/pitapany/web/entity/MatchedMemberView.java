package com.pitapany.web.entity;

import java.util.Date;

public class MatchedMemberView extends Member{
	private Date matchDate;
	private String memberAccompanyInfoId;
	private String memberId;
	
	public Date getMatchDate() {
		return matchDate;
	}
	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}
	public String getMemberAccompanyInfoId() {
		return memberAccompanyInfoId;
	}
	public void setMemberAccompanyInfoId(String memberAccompanyInfoId) {
		this.memberAccompanyInfoId = memberAccompanyInfoId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	
}

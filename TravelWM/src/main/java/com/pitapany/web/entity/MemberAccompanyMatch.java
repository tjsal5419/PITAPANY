package com.pitapany.web.entity;

import java.util.Date;

public class MemberAccompanyMatch {
	private String id;
	private Date matchDate;
	private String memberId;
	private String matchedMemberId;
	private String memberAccompanyInfoId;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public Date getMatchDate() {
		return matchDate;
	}
	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public String getMatchedMemberId() {
		return matchedMemberId;
	}
	public void setMatchedMemberId(String matchedMemberId) {
		this.matchedMemberId = matchedMemberId;
	}
	public String getMemberAccompanyInfoId() {
		return memberAccompanyInfoId;
	}
	public void setMemberAccompanyInfoId(String memberAccompanyInfoId) {
		this.memberAccompanyInfoId = memberAccompanyInfoId;
	}
	

}
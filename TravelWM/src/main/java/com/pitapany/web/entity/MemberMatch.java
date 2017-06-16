package com.pitapany.web.entity;

import java.sql.Date;

public class MemberMatch {
	private String id;
	private String memberId;
	private Date matchedDate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Date getMatchedDate() {
		return matchedDate;
	}
	public void setMatchedDate(Date matchedDate) {
		this.matchedDate = matchedDate;
	}
	
	
	
}

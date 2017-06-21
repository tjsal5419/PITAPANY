package com.pitapany.web.entity;

import java.util.Date;

public class MemberBookmark {
	private String memberId;
	private String bookmarkedMemberId;
	private Date regDate;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getBookMarkedMemberId() {
		return bookmarkedMemberId;
	}
	public void setBookMarkedMemberId(String bookmarkedMemberId) {
		this.bookmarkedMemberId = bookmarkedMemberId;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
package com.pitapany.web.entity;

public class MemberAccompanyBoardBookmark extends AccompanyBoard {
	private String memberId;
	private String accompanyBoardId;
	
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public void setAccompanyBoardId(String accompanyBoardId) {
		this.accompanyBoardId = accompanyBoardId;
	}
	public String getMemberId() {
		return memberId;
	}
	public String getAccompanyBoardId() {
		return accompanyBoardId;
	}

}

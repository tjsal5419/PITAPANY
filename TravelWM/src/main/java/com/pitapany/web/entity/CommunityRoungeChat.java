package com.pitapany.web.entity;

import java.sql.Date;

public class CommunityRoungeChat {
	
	private String id;
	private String communityRoungeId;
	private String memberId;
	private String message;
	private Date messageRegDate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCommunityRoungeId() {
		return communityRoungeId;
	}
	public void setCommunityRoungeId(String communityRoungeId) {
		this.communityRoungeId = communityRoungeId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getMessageRegDate() {
		return messageRegDate;
	}
	public void setMessageRegDate(Date messageRegDate) {
		this.messageRegDate = messageRegDate;
	}

}

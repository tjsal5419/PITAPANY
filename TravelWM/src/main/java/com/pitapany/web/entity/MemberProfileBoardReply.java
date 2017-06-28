package com.pitapany.web.entity;

import java.util.Date;

public class MemberProfileBoardReply {
	private String id;
	private String reply;
	private int isSecret;
	private String memberId;
	private Date regDate;
	private String memberProfileBoardId;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public int getIsSecret() {
		return isSecret;
	}

	public void setIsSecret(int isSecret) {
		this.isSecret = isSecret;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getMemberProfileBoardId() {
		return memberProfileBoardId;
	}

	public void setMemberProfileBoardId(String memberProfileBoardId) {
		this.memberProfileBoardId = memberProfileBoardId;
	}
}

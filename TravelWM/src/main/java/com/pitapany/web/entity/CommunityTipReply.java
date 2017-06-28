package com.pitapany.web.entity;
import java.util.Date;

public class CommunityTipReply {
	private String id;
	private String memberId;
	private String reply;
	private Date regDate;
	private int isSecret;
	private String communityTipId;

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

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getIsSecret() {
		return isSecret;
	}

	public void setIsSecret(int isSecret) {
		this.isSecret = isSecret;
	}

	public String getCommunityTipId() {
		return communityTipId;
	}

	public void setCommunityTipId(String communityTipId) {
		this.communityTipId = communityTipId;
	}
}

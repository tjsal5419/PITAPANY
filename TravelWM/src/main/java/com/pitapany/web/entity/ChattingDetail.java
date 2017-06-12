package com.pitapany.web.entity;

import java.sql.Date;

public class ChattingDetail {
	
	private String id;
	private String content;
	private Date regDate;
	private int isRead;
	private String ChattingId;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getIsRead() {
		return isRead;
	}
	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}
	public String getChattingId() {
		return ChattingId;
	}
	public void setChattingId(String chattingId) {
		ChattingId = chattingId;
	}

}

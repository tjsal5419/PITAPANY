package com.pitapany.web.entity;
import java.util.Date;

public class CommunityTip {
	private String id;
	private String title;
	private Date regDate;
	private String hits;
	private String memberId;
	private String content;
	private String tipCategoryId;
	
	public String getId() {
		return id;
	}
	public String getTipCategoryId() {
		return tipCategoryId;
	}
	public void setTipCategoryId(String category) {
		this.tipCategoryId = category;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getHits() {
		return hits;
	}
	public void setHits(String hits) {
		this.hits = hits;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}

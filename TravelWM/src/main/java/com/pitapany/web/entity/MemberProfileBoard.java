package com.pitapany.web.entity;

import java.util.Date;

public class MemberProfileBoard {
	private String id;
	private String content;
	private String src;
	private String name;
	private int like;
	private float latitude;
	private float longitude;
	private String locality;
	private String country;
	private String place;
	private Date regDate;
	private String memberProfileId;

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

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public float getLatitude() {
		return latitude;
	}

	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}

	public float getLongitude() {
		return longitude;
	}

	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}

	public String getLocality() {
		return locality;
	}

	public void setLocality(String locality) {
		this.locality = locality;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getMemberProfileId() {
		return memberProfileId;
	}

	public void setMemberProfileId(String memberProfileId) {
		this.memberProfileId = memberProfileId;
	}
}

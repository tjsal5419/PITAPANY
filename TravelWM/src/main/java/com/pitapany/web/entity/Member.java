package com.pitapany.web.entity;

import java.sql.Date;

public class Member {
	private String id;
	private String email;
	private String password;
	private String name;
	private int sex;
	private Date birthday;
	private Date regDate;
	private int matchedTimes;
	private String phone;
	private int age;
	private String nicName;
	private String lastLoginIp;
	private Date lastLoginTime;
	private String pwdModifyKey;
	private String matchCount;
	private String role;

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getMatchedTimes() {
		return matchedTimes;
	}

	public void setMatchedTimes(int matchedTimes) {
		this.matchedTimes = matchedTimes;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getNicName() {
		return nicName;
	}

	public void setNicName(String nicName) {
		this.nicName = nicName;
	}

	public String getLastLoginIp() {
		return lastLoginIp;
	}

	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getPwdModifyKey() {
		return pwdModifyKey;
	}

	public void setPwdModifyKey(String pwdModifyKey) {
		this.pwdModifyKey = pwdModifyKey;
	}

	public String getMatchCount() {
		return matchCount;
	}

	public void setMatchCount(String matchCount) {
		this.matchCount = matchCount;
	}

}

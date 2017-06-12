package com.pitapany.web.entity;

import java.sql.Date;

public class CommunityTipView extends CommunityTip{
	private String nicName;
	private String category;

	public String getNicName() {
		return nicName;
	}

	public void setNicName(String nicName) {
		this.nicName = nicName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
}

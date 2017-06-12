package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.AccompanyStyle;

public interface AccompanyStyleDao {
	AccompanyStyle get(String id);
	List<AccompanyStyle> getList();
	
	int delete(String id);
	int add(AccompanyStyle accompanyStyle);
	int update(AccompanyStyle accompanyStyle);
}

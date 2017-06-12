package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.Style;

public interface StyleDao {
	List<Style> getList();
	Style get(String id);
	
	int delete(String id);
	int add(Style style);
	int update(Style style);
}

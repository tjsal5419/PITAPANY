package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.QnA;

public interface QnADao {
	QnA get(String id);
	List<QnA> getList();
	
	int delete(String id);
	int add(QnA qnA);
	int update(QnA qnA);
}

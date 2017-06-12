package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.ChattingDetail;
import com.pitapany.web.entity.Member;

public interface ChattingDetailDao {
	ChattingDetail get(String id);
	List<ChattingDetail> getList();

	int delete(String id);
/*	int add(ChattingDetail chattingDetail);*/
	int update(ChattingDetail chattingDetail);
	
}

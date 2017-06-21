package com.pitapany.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pitapany.web.entity.MemberProfileBoard;

public interface MemberProfileBoardDao {
	MemberProfileBoard get(String id);

	List<MemberProfileBoard> getPage(@Param("page")int page);
	List<MemberProfileBoard> getList();

	int count();
	int addLike(String id);

	int delete(String id);

	int add(MemberProfileBoard memberProfileBoard);

	int update(MemberProfileBoard memberProfileBoard);
}

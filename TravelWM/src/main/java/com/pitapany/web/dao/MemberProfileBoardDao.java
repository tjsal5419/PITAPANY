package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.MemberProfileBoard;

public interface MemberProfileBoardDao {
	MemberProfileBoard get(String id);

	List<MemberProfileBoard> getList(String memberProfileId);

	int addLike(String id);

	int delete(String id);

	int add(MemberProfileBoard memberProfileBoard);

	int update(MemberProfileBoard memberProfileBoard);
}

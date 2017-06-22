package com.pitapany.web.dao;

import java.util.List;

import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.AccompanyBoardFile;
import com.pitapany.web.entity.AccompanyBoardView;

public interface AccompanyBoardFileDao {

	List<AccompanyBoardFile> getList(String id);

	int add(AccompanyBoardFile accompanyBoardFile);
	int update(AccompanyBoardFile accompanyBoardFile);
	AccompanyBoardFile get(String accompanyBoardId);
}

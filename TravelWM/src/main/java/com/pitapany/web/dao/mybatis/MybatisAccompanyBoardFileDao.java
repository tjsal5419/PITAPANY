package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.AccompanyBoardDao;
import com.pitapany.web.dao.AccompanyBoardFileDao;
import com.pitapany.web.dao.CommunityTipDao;
import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.AccompanyBoardFile;
import com.pitapany.web.entity.AccompanyBoardView;

public class MybatisAccompanyBoardFileDao implements AccompanyBoardFileDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<AccompanyBoardFile> getList(String id) {
		AccompanyBoardFileDao accBoardFileDao = sqlSession.getMapper(AccompanyBoardFileDao.class);
		return accBoardFileDao.getList(id);
	}

	@Override
	public int add(AccompanyBoardFile accompanyBoardFile) {
		AccompanyBoardFileDao accBoardFileDao = sqlSession.getMapper(AccompanyBoardFileDao.class);
		return accBoardFileDao.add(accompanyBoardFile);
	}

	@Override
	public int update(AccompanyBoardFile accompanyBoardFile) {
		AccompanyBoardFileDao accBoardFileDao = sqlSession.getMapper(AccompanyBoardFileDao.class);
		return accBoardFileDao.update(accompanyBoardFile);
	}

	@Override
	public AccompanyBoardFile get(String accompanyBoardId) {
		AccompanyBoardFileDao accBoardFileDao = sqlSession.getMapper(AccompanyBoardFileDao.class);
		return accBoardFileDao.get(accompanyBoardId);
	}

}

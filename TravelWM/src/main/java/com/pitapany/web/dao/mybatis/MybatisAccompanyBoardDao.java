package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.AccompanyBoardDao;
import com.pitapany.web.entity.AccompanyBoard;

public class MybatisAccompanyBoardDao implements AccompanyBoardDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public AccompanyBoard get(String id) {
		AccompanyBoardDao accBoardDao = sqlSession.getMapper(AccompanyBoardDao.class);
		return accBoardDao.get(id);
	}

	@Override
	public List<AccompanyBoard> getList() {
		AccompanyBoardDao accBoardDao = sqlSession.getMapper(AccompanyBoardDao.class);
		return accBoardDao.getList();
	}

	@Override
	public int delete(String id) {
		AccompanyBoardDao accBoardDao = sqlSession.getMapper(AccompanyBoardDao.class);
		return accBoardDao.delete(id);
	}

	@Override
	public int add(AccompanyBoard accompanyBoard) {
		AccompanyBoardDao accBoardDao = sqlSession.getMapper(AccompanyBoardDao.class);
		return accBoardDao.add(accompanyBoard);
	}

	@Override
	public int update(AccompanyBoard accompanyBoard) {
		AccompanyBoardDao accBoardDao = sqlSession.getMapper(AccompanyBoardDao.class);
		return accBoardDao.update(accompanyBoard);
	}

}

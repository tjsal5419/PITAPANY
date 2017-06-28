package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.AccompanyBoardReplyDao;
import com.pitapany.web.entity.AccompanyBoardReply;
import com.pitapany.web.entity.OnlyAccReplyView;

public class MybatisAccompanyBoardReplyDao implements AccompanyBoardReplyDao {
	@Autowired
	SqlSession sqlSession;

	@Override
	public AccompanyBoardReply get(String id) {
		AccompanyBoardReplyDao accBoardReplyDao = sqlSession.getMapper(AccompanyBoardReplyDao.class);
		return accBoardReplyDao.get(id);
	}

	@Override
	public List<AccompanyBoardReply> getList(String id) {
		AccompanyBoardReplyDao accBoardReplyDao = sqlSession.getMapper(AccompanyBoardReplyDao.class);
		return accBoardReplyDao.getList(id);
	}

	@Override
	public int delete(String id) {
		AccompanyBoardReplyDao accBoardReplyDao = sqlSession.getMapper(AccompanyBoardReplyDao.class);
		return accBoardReplyDao.delete(id);
	}

	@Override
	public int add(AccompanyBoardReply accompanyBoardReply) {
		AccompanyBoardReplyDao accBoardReplyDao = sqlSession.getMapper(AccompanyBoardReplyDao.class);
		return accBoardReplyDao.add(accompanyBoardReply);
	}

	@Override
	public int update(AccompanyBoardReply accompanyBoardReply) {
		AccompanyBoardReplyDao accBoardReplyDao = sqlSession.getMapper(AccompanyBoardReplyDao.class);
		return accBoardReplyDao.update(accompanyBoardReply);
	}

	@Override
	public List<OnlyAccReplyView> getReplyList(String id) {
		AccompanyBoardReplyDao accBoardReplyDao = sqlSession.getMapper(AccompanyBoardReplyDao.class);
		return accBoardReplyDao.getReplyList(id);
	}

}

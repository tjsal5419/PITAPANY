package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.ChattingDao;
import com.pitapany.web.entity.Chatting;

public class MybatisChattingDao implements ChattingDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public Chatting get(String id) {
		ChattingDao chattingDao = sqlSession.getMapper(ChattingDao.class);
		return chattingDao.get(id);
	}

	@Override
	public List<Chatting> getList() {
		ChattingDao chattingDao = sqlSession.getMapper(ChattingDao.class);
		return chattingDao.getList();
	}

	@Override
	public int delete(String id) {
		ChattingDao chattingDao = sqlSession.getMapper(ChattingDao.class);
		return chattingDao.delete(id);
	}

	@Override
	public int add(Chatting chatting) {
		ChattingDao chattingDao = sqlSession.getMapper(ChattingDao.class);
		return chattingDao.add(chatting);
	}

	@Override
	public int update(Chatting chatting) {
		ChattingDao chattingDao = sqlSession.getMapper(ChattingDao.class);
		return chattingDao.update(chatting);
	}

}

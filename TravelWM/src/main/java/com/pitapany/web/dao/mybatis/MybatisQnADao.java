package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.QnADao;
import com.pitapany.web.entity.QnA;

public class MybatisQnADao implements QnADao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public QnA get(String id) {
		QnADao qnADao = sqlSession.getMapper(QnADao.class);
		return qnADao.get(id);
	}

	@Override
	public List<QnA> getList() {
		QnADao qnADao = sqlSession.getMapper(QnADao.class);
		return qnADao.getList();
	}

	@Override
	public int delete(String id) {
		QnADao qnADao = sqlSession.getMapper(QnADao.class);
		return qnADao.delete(id);
	}

	@Override
	public int add(QnA qnA) {
		QnADao qnADao = sqlSession.getMapper(QnADao.class);
		return qnADao.add(qnA);
	}

	@Override
	public int update(QnA qnA) {
		QnADao qnADao = sqlSession.getMapper(QnADao.class);
		return qnADao.update(qnA);
	}

}

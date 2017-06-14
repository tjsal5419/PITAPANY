package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.AccompanyStyleDao;
import com.pitapany.web.entity.AccompanyStyle;

public class MybatisAccompanyStyleDao implements AccompanyStyleDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public AccompanyStyle get(String id) {
		AccompanyStyleDao accStyleDao = sqlSession.getMapper(AccompanyStyleDao.class);
		return accStyleDao.get(id);
	}

	@Override
	public List<AccompanyStyle> getList() {
		AccompanyStyleDao accStyleDao = sqlSession.getMapper(AccompanyStyleDao.class);
		return accStyleDao.getList();
	}

	@Override
	public int delete(String id) {
		AccompanyStyleDao accStyleDao = sqlSession.getMapper(AccompanyStyleDao.class);
		return accStyleDao.delete(id);
	}

	@Override
	public int add(AccompanyStyle accompanyStyle) {
		AccompanyStyleDao accStyleDao = sqlSession.getMapper(AccompanyStyleDao.class);
		return accStyleDao.add(accompanyStyle);
	}

	@Override
	public int update(AccompanyStyle accompanyStyle) {
		AccompanyStyleDao accStyleDao = sqlSession.getMapper(AccompanyStyleDao.class);
		return accStyleDao.update(accompanyStyle);
	}

}

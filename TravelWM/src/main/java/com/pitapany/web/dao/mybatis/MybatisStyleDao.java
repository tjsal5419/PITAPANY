package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.MemberDao;
import com.pitapany.web.dao.StyleDao;
import com.pitapany.web.entity.Member;
import com.pitapany.web.entity.Style;

public class MybatisStyleDao implements StyleDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Style> getList() {
		StyleDao styleDao = sqlSession.getMapper(StyleDao.class);
		return styleDao.getList();
	}

	@Override
	public Style get(String id) {
		StyleDao styleDao = sqlSession.getMapper(StyleDao.class);
		return styleDao.get(id);
	}

	@Override
	public int delete(String id) {
		StyleDao styleDao = sqlSession.getMapper(StyleDao.class);
		return styleDao.delete(id);
	}

	@Override
	public int add(Style style) {
		StyleDao styleDao = sqlSession.getMapper(StyleDao.class);
		return styleDao.add(style);
	}

	@Override
	public int update(Style style) {
		StyleDao styleDao = sqlSession.getMapper(StyleDao.class);
		return styleDao.update(style);
	}
	
	
	
}

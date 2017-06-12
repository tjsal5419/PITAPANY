package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.ChattingDetailDao;
import com.pitapany.web.dao.MemberDao;
import com.pitapany.web.dao.StyleDao;
import com.pitapany.web.dao.TipCategoryDao;
import com.pitapany.web.entity.ChattingDetail;
import com.pitapany.web.entity.Member;
import com.pitapany.web.entity.Style;
import com.pitapany.web.entity.TipCategory;

public class MybatisTipCategoryDao implements TipCategoryDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public TipCategory get(String id) {
		TipCategoryDao tipCategoryDao = sqlSession.getMapper(TipCategoryDao.class);
		return tipCategoryDao.get(id);
	}

	@Override
	public List<TipCategory> getList() {
		TipCategoryDao tipCategoryDao = sqlSession.getMapper(TipCategoryDao.class);
		return tipCategoryDao.getList();
	}

	@Override
	public int delete(String id) {
		TipCategoryDao tipCategoryDao = sqlSession.getMapper(TipCategoryDao.class);
		return tipCategoryDao.delete(id);
	}

	@Override
	public int add(TipCategory communityTip) {
		TipCategoryDao tipCategoryDao = sqlSession.getMapper(TipCategoryDao.class);
		return tipCategoryDao.add(communityTip);
	}

	@Override
	public int update(TipCategory communityTip) {
		TipCategoryDao tipCategoryDao = sqlSession.getMapper(TipCategoryDao.class);
		return tipCategoryDao.update(communityTip);
	}

	
	
}

package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.AccompanyBoardDao;
import com.pitapany.web.dao.CommunityTipDao;
import com.pitapany.web.dao.MemberBookmarkDao;
import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.MemberBookmark;

public class MybatisMemberBookmarkDao implements MemberBookmarkDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public MemberBookmark get(String id) {
		MemberBookmarkDao memberBookmarkDao = sqlSession.getMapper(MemberBookmarkDao.class);
		return memberBookmarkDao.get(id);
	}

	@Override
	public List<MemberBookmark> getList(int page) {
		MemberBookmarkDao memberBookmarkDao = sqlSession.getMapper(MemberBookmarkDao.class);
		return memberBookmarkDao.getList(page);
	}

	@Override
	public int delete(String id) {
		MemberBookmarkDao memberBookmarkDao = sqlSession.getMapper(MemberBookmarkDao.class);
		return memberBookmarkDao.delete(id);
	}

	@Override
	public int add(MemberBookmark memberBookmark) {
		MemberBookmarkDao memberBookmarkDao = sqlSession.getMapper(MemberBookmarkDao.class);
		return memberBookmarkDao.add(memberBookmark);
	}

	@Override
	public int count() {
		MemberBookmarkDao memberBookmarkDao = sqlSession.getMapper(MemberBookmarkDao.class);
		return memberBookmarkDao.count();
	}

}

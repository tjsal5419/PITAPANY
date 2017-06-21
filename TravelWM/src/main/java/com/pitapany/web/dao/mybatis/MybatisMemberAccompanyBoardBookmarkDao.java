package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.MemberAccompanyBoardBookmarkDao;
import com.pitapany.web.dao.MemberAccompanyInfoDao;
import com.pitapany.web.entity.MemberAccompanyBoardBookmark;

public class MybatisMemberAccompanyBoardBookmarkDao implements MemberAccompanyBoardBookmarkDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public MemberAccompanyBoardBookmark get(String id) {
		MemberAccompanyBoardBookmarkDao memberAccBoardBookmarkDao = sqlSession.getMapper(MemberAccompanyBoardBookmarkDao.class);
		return memberAccBoardBookmarkDao.get(id);
	}

	@Override
	public List<MemberAccompanyBoardBookmark> getList(int page) {
		MemberAccompanyBoardBookmarkDao memberAccBoardBookmarkDao = sqlSession.getMapper(MemberAccompanyBoardBookmarkDao.class);
		return memberAccBoardBookmarkDao.getList(page);
	}

	@Override
	public int delete(String id) {
		MemberAccompanyBoardBookmarkDao memberAccBoardBookmarkDao = sqlSession.getMapper(MemberAccompanyBoardBookmarkDao.class);
		return memberAccBoardBookmarkDao.delete(id);
	}

	@Override
	public int add(MemberAccompanyBoardBookmark memberAccompanyBoardBookmark) {
		MemberAccompanyBoardBookmarkDao memberAccBoardBookmarkDao = sqlSession.getMapper(MemberAccompanyBoardBookmarkDao.class);
		return memberAccBoardBookmarkDao.add(memberAccompanyBoardBookmark);
	}

	@Override
	public int count() {
		MemberAccompanyBoardBookmarkDao memberAccBoardBookmarkDao = sqlSession.getMapper(MemberAccompanyBoardBookmarkDao.class);
		return memberAccBoardBookmarkDao.count();
	}

}

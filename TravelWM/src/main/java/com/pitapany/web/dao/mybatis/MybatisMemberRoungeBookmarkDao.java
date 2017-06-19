package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.MemberRoungeBookmarkDao;
import com.pitapany.web.entity.MemberRoungeBookmark;

public class MybatisMemberRoungeBookmarkDao implements MemberRoungeBookmarkDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public MemberRoungeBookmark get(String id) {
		MemberRoungeBookmarkDao memberRoungeBookmarkDao = sqlSession.getMapper(MemberRoungeBookmarkDao.class);
		return memberRoungeBookmarkDao.get(id);
	}

	@Override
	public List<MemberRoungeBookmark> getList() {
		MemberRoungeBookmarkDao memberRoungeBookmarkDao = sqlSession.getMapper(MemberRoungeBookmarkDao.class);
		return memberRoungeBookmarkDao.getList();
	}

	@Override
	public int delete(String id) {
		MemberRoungeBookmarkDao memberRoungeBookmarkDao = sqlSession.getMapper(MemberRoungeBookmarkDao.class);
		return memberRoungeBookmarkDao.delete(id);
	}

	@Override
	public int add(MemberRoungeBookmark memberRoungeBookmark) {
		MemberRoungeBookmarkDao memberRoungeBookmarkDao = sqlSession.getMapper(MemberRoungeBookmarkDao.class);
		return memberRoungeBookmarkDao.add(memberRoungeBookmark);
	}

	@Override
	public int update(MemberRoungeBookmark memberRoungeBookmark) {
		MemberRoungeBookmarkDao memberRoungeBookmarkDao = sqlSession.getMapper(MemberRoungeBookmarkDao.class);
		return memberRoungeBookmarkDao.update(memberRoungeBookmark);
	}
	
}

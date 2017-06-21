package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.MemberProfileBoardDao;
import com.pitapany.web.entity.MemberProfileBoard;

public class MybatisMemberProfileBoardDao implements MemberProfileBoardDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberProfileBoard get(String id) {
		MemberProfileBoardDao memberProfileBoardDao = sqlSession.getMapper(MemberProfileBoardDao.class);
		return memberProfileBoardDao.get(id);
	}

	@Override
	public List<MemberProfileBoard> getList(int page) {
		MemberProfileBoardDao memberProfileBoardDao = sqlSession.getMapper(MemberProfileBoardDao.class);
		return memberProfileBoardDao.getList(page);
	}

	@Override
	public int addLike(String id) {
		MemberProfileBoardDao memberProfileBoardDao = sqlSession.getMapper(MemberProfileBoardDao.class);
		return memberProfileBoardDao.addLike(id);
	}

	@Override
	public int delete(String id) {
		MemberProfileBoardDao memberProfileBoardDao = sqlSession.getMapper(MemberProfileBoardDao.class);
		return memberProfileBoardDao.delete(id);
	}

	@Override
	public int add(MemberProfileBoard memberProfileBoard) {
		MemberProfileBoardDao memberProfileBoardDao = sqlSession.getMapper(MemberProfileBoardDao.class);
		return memberProfileBoardDao.add(memberProfileBoard);
	}

	@Override
	public int update(MemberProfileBoard memberProfileBoard) {
		MemberProfileBoardDao memberProfileBoardDao = sqlSession.getMapper(MemberProfileBoardDao.class);
		return memberProfileBoardDao.update(memberProfileBoard);
	}

}

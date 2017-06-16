package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.MemberMatchDao;
import com.pitapany.web.entity.MemberMatch;

public class MybatisMemberMatchDao implements MemberMatchDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public MemberMatch get(String id) {
		MemberMatchDao memberMatchDao = sqlSession.getMapper(MemberMatchDao.class);
		return memberMatchDao.get(id);
	}

	@Override
	public List<MemberMatch> getList() {
		MemberMatchDao memberMatchDao = sqlSession.getMapper(MemberMatchDao.class);
		return memberMatchDao.getList();
	}

	@Override
	public int delete(String id) {
		MemberMatchDao memberMatchDao = sqlSession.getMapper(MemberMatchDao.class);
		return memberMatchDao.delete(id);
	}

	@Override
	public int add(MemberMatch memberMatch) {
		MemberMatchDao memberMatchDao = sqlSession.getMapper(MemberMatchDao.class);
		return memberMatchDao.add(memberMatch);
	}

	@Override
	public int update(MemberMatch memberMatch) {
		MemberMatchDao memberMatchDao = sqlSession.getMapper(MemberMatchDao.class);
		return memberMatchDao.update(memberMatch);
	}

	
}

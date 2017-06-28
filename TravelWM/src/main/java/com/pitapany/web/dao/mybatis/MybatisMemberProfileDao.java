package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.MemberProfileDao;
import com.pitapany.web.entity.MemberProfile;

public class MybatisMemberProfileDao implements MemberProfileDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public MemberProfile get(String id) {
		MemberProfileDao memberProfileDao =  sqlSession.getMapper(MemberProfileDao.class);
		return memberProfileDao.get(id);
	}

	@Override
	public List<MemberProfile> getList() {
		MemberProfileDao memberProfileDao =  sqlSession.getMapper(MemberProfileDao.class);
		return memberProfileDao.getList();
	}

	@Override
	public int delete(String id) {
		MemberProfileDao memberProfileDao =  sqlSession.getMapper(MemberProfileDao.class);
		return memberProfileDao.delete(id);
	}

	@Override
	public int add(MemberProfile memberProfile) {
		MemberProfileDao memberProfileDao =  sqlSession.getMapper(MemberProfileDao.class);
		return memberProfileDao.add(memberProfile);
	}

	@Override
	public int update(MemberProfile memberProfile) {
		MemberProfileDao memberProfileDao =  sqlSession.getMapper(MemberProfileDao.class);
		return memberProfileDao.update(memberProfile);
	}

	@Override
	public MemberProfile getByMemberId(String memberId) {
		MemberProfileDao memberProfileDao =  sqlSession.getMapper(MemberProfileDao.class);
		return memberProfileDao.getByMemberId(memberId);
	}

	@Override
	public int isRegisterd(String memberId) {
		MemberProfileDao memberProfileDao =  sqlSession.getMapper(MemberProfileDao.class);
		return memberProfileDao.isRegisterd(memberId);
	}
	
}

package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.MemberDao;
import com.pitapany.web.entity.Member;

public class MybatisMemberDao implements MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	public Member get(String id) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.get(id);
	}

	public List<Member> getList() {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.getList();
	}


	public int delete(String id) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		int result = memberDao.delete(id);
		return result;
	}

	public int add(Member member) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.add(member);
	}

	public int update(Member member) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.update(member);
	}

	public int updateAgeAll() {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.updateAgeAll();
	}
	
	public String getIdByEmail(String email) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.getIdByEmail(email);
	}
	
	public int getSizeByEmail(String email) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.getSizeByEmail(email);
	}

	@Override
	public Member getMember(String id) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.getMember(id);
	}

	@Override
	public int addMatchCount(String id) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.addMatchCount(id);
	}

	@Override
	public int getMatchCount(String id) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.getMatchCount(id);

	}
	
}

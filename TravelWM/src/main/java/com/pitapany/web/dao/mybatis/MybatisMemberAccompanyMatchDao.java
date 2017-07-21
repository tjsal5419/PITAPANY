package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.AccompanyBoardDao;
import com.pitapany.web.dao.CommunityTipDao;
import com.pitapany.web.dao.MemberAccompanyMatchDao;
import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.MatchedMemberView;
import com.pitapany.web.entity.MemberAccompanyMatch;
import com.pitapany.web.entity.MemberProfInfoMatchingResultView;

public class MybatisMemberAccompanyMatchDao implements MemberAccompanyMatchDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public MemberAccompanyMatch get(String id) {
		MemberAccompanyMatchDao memberAccMatchDao = sqlSession.getMapper(MemberAccompanyMatchDao.class);
		return memberAccMatchDao.get(id);
	}

	@Override
	public List<MemberAccompanyMatch> getList(int page) {
		MemberAccompanyMatchDao memberAccMatchDao = sqlSession.getMapper(MemberAccompanyMatchDao.class);
		return memberAccMatchDao.getList(page);
	}

	@Override
	public int delete(String id) {
		MemberAccompanyMatchDao memberAccMatchDao = sqlSession.getMapper(MemberAccompanyMatchDao.class);
		return memberAccMatchDao.delete(id);
	}

	@Override
	public int add(MemberAccompanyMatch memberAccompanyMatch) {
		MemberAccompanyMatchDao memberAccMatchDao = sqlSession.getMapper(MemberAccompanyMatchDao.class);
		return memberAccMatchDao.add(memberAccompanyMatch);
	}

	@Override
	public int count() {
		MemberAccompanyMatchDao memberAccMatchDao = sqlSession.getMapper(MemberAccompanyMatchDao.class);
		return memberAccMatchDao.count();
	}

	@Override
	public List<MemberAccompanyMatch> getByMemberId(String memberId) {
		MemberAccompanyMatchDao memberAccMatchDao = sqlSession.getMapper(MemberAccompanyMatchDao.class);
		return memberAccMatchDao.getByMemberId(memberId);
		
	}

	@Override
	public List<MatchedMemberView> getMatchedMemberList(String memberId) {
		MemberAccompanyMatchDao memberAccMatchDao = sqlSession.getMapper(MemberAccompanyMatchDao.class);
		return memberAccMatchDao.getMatchedMemberList(memberId);
	}

	@Override
	public int deleteByAccomInfoId(String memberAccompanyInfoId) {
		MemberAccompanyMatchDao memberAccMatchDao = sqlSession.getMapper(MemberAccompanyMatchDao.class);
		return memberAccMatchDao.deleteByAccomInfoId(memberAccompanyInfoId);

	}

	@Override
	public List<MemberAccompanyMatch> getByMemberIdToday(String memberId) {
		MemberAccompanyMatchDao memberAccMatchDao = sqlSession.getMapper(MemberAccompanyMatchDao.class);
		return memberAccMatchDao.getByMemberIdToday(memberId);
	}

	@Override
	public int deleteAll(String memberId) {
		MemberAccompanyMatchDao memberAccMatchDao = sqlSession.getMapper(MemberAccompanyMatchDao.class);
		return memberAccMatchDao.deleteAll(memberId);
	}


}

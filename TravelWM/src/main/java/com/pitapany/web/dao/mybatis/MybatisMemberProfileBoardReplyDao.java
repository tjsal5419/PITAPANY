package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.MemberProfileBoardReplyDao;
import com.pitapany.web.entity.MemberProfileBoardReply;
import com.pitapany.web.entity.OnlyProfBoardReplyView;

public class MybatisMemberProfileBoardReplyDao implements MemberProfileBoardReplyDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberProfileBoardReply get(String id) {
		MemberProfileBoardReplyDao memberProfileBoardReplyDao = sqlSession.getMapper(MemberProfileBoardReplyDao.class);
		return memberProfileBoardReplyDao.get(id);
	}

	@Override
	public List<MemberProfileBoardReply> getList(String memberProfileBoardId) {
		MemberProfileBoardReplyDao memberProfileBoardReplyDao = sqlSession.getMapper(MemberProfileBoardReplyDao.class);
		return memberProfileBoardReplyDao.getList(memberProfileBoardId);
	}

	@Override
	public int count() {
		MemberProfileBoardReplyDao memberProfileBoardReplyDao = sqlSession.getMapper(MemberProfileBoardReplyDao.class);
		return memberProfileBoardReplyDao.count();
	}

	@Override
	public int delete(String id) {
		MemberProfileBoardReplyDao memberProfileBoardReplyDao = sqlSession.getMapper(MemberProfileBoardReplyDao.class);
		return memberProfileBoardReplyDao.delete(id);
	}

	@Override
	public int add(MemberProfileBoardReply memberProfileBoardReply) {
		MemberProfileBoardReplyDao memberProfileBoardReplyDao = sqlSession.getMapper(MemberProfileBoardReplyDao.class);
		return memberProfileBoardReplyDao.add(memberProfileBoardReply);
	}

	@Override
	public int update(MemberProfileBoardReply memberProfileBoardReply) {
		MemberProfileBoardReplyDao memberProfileBoardReplyDao = sqlSession.getMapper(MemberProfileBoardReplyDao.class);
		return memberProfileBoardReplyDao.update(memberProfileBoardReply);
	}

	@Override
	public List<OnlyProfBoardReplyView> getReplyList(String id) {
		MemberProfileBoardReplyDao memberProfileBoardReplyDao = sqlSession.getMapper(MemberProfileBoardReplyDao.class);
		return memberProfileBoardReplyDao.getReplyList(id);
	}

}

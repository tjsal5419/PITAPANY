package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.CommunityTipReplyDao;
import com.pitapany.web.entity.CommunityTipReply;
import com.pitapany.web.entity.OnlyTipReplyView;

public class MybatisCommunityTipReplyDao implements CommunityTipReplyDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public CommunityTipReply get(String id) {
		CommunityTipReplyDao tipReplyDao = sqlSession.getMapper(CommunityTipReplyDao.class);
		return tipReplyDao.get(id);
	}

	@Override
	public List<CommunityTipReply> getList(String id) {
		CommunityTipReplyDao tipReplyDao = sqlSession.getMapper(CommunityTipReplyDao.class);
		return tipReplyDao.getList(id);
	}

	@Override
	public List<OnlyTipReplyView> getReplyList(String id) {
		CommunityTipReplyDao tipReplyDao = sqlSession.getMapper(CommunityTipReplyDao.class);
		return tipReplyDao.getReplyList(id);
	}

	@Override
	public int delete(String id) {
		CommunityTipReplyDao tipReplyDao = sqlSession.getMapper(CommunityTipReplyDao.class);
		return tipReplyDao.delete(id);
	}

	@Override
	public int add(CommunityTipReply communityTipReply) {
		CommunityTipReplyDao tipReplyDao = sqlSession.getMapper(CommunityTipReplyDao.class);
		return tipReplyDao.add(communityTipReply);
	}

	@Override
	public int update(CommunityTipReply communityTipReply) {
		CommunityTipReplyDao tipReplyDao = sqlSession.getMapper(CommunityTipReplyDao.class);
		return tipReplyDao.update(communityTipReply);
	}

}

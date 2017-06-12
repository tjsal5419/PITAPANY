package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.ChattingDetailDao;
import com.pitapany.web.dao.CommunityTipDao;
import com.pitapany.web.dao.MemberDao;
import com.pitapany.web.dao.StyleDao;
import com.pitapany.web.entity.ChattingDetail;
import com.pitapany.web.entity.CommunityTip;
import com.pitapany.web.entity.CommunityTipView;
import com.pitapany.web.entity.Member;
import com.pitapany.web.entity.Style;

public class MybatisCommunityTipDao implements CommunityTipDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public CommunityTipView get(String id) {
		CommunityTipDao tipDao = sqlSession.getMapper(CommunityTipDao.class);
		return tipDao.get(id);
	}

	@Override
	public List<CommunityTipView> getList() {
		CommunityTipDao tipDao = sqlSession.getMapper(CommunityTipDao.class);
		return tipDao.getList();
	}

	@Override
	public int delete(String id) {
		CommunityTipDao tipDao = sqlSession.getMapper(CommunityTipDao.class);
		return tipDao.delete(id);
	}

	@Override
	public int add(CommunityTip communityTip) {
		CommunityTipDao tipDao = sqlSession.getMapper(CommunityTipDao.class);
		return tipDao.add(communityTip);
	}

	@Override
	public int update(CommunityTip communityTip) {
		CommunityTipDao tipDao = sqlSession.getMapper(CommunityTipDao.class);
		return tipDao.update(communityTip);
	}
	
	
	
}

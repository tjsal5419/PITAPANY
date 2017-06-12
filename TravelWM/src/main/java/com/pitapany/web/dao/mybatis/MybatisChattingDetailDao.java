package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.ChattingDetailDao;
import com.pitapany.web.dao.MemberDao;
import com.pitapany.web.dao.StyleDao;
import com.pitapany.web.entity.ChattingDetail;
import com.pitapany.web.entity.Member;
import com.pitapany.web.entity.Style;

public class MybatisChattingDetailDao implements ChattingDetailDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public ChattingDetail get(String id) {
		ChattingDetailDao chatDetailDao = sqlSession.getMapper(ChattingDetailDao.class);
		return chatDetailDao.get(id);
	}

	@Override
	public List<ChattingDetail> getList() {
		ChattingDetailDao chatDetailDao = sqlSession.getMapper(ChattingDetailDao.class);
		return chatDetailDao.getList();
	}

	@Override
	public int delete(String id) {
		ChattingDetailDao chatDetailDao = sqlSession.getMapper(ChattingDetailDao.class);
		return chatDetailDao.delete(id);
	}

	@Override
	public int update(ChattingDetail chattingDetail) {
		ChattingDetailDao chatDetailDao = sqlSession.getMapper(ChattingDetailDao.class);
		return chatDetailDao.update(chattingDetail);
	}

	
}

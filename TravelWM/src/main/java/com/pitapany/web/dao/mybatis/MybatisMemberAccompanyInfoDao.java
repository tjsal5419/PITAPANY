package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.AccompanyBoardDao;
import com.pitapany.web.dao.CommunityTipDao;
import com.pitapany.web.dao.MemberAccompanyInfoDao;
import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.MemberAccompanyInfo;

public class MybatisMemberAccompanyInfoDao implements MemberAccompanyInfoDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public MemberAccompanyInfo get(String id) {
		MemberAccompanyInfoDao accInfoDao = sqlSession.getMapper(MemberAccompanyInfoDao.class);
		return accInfoDao.get(id);
	}

	@Override
	public List<MemberAccompanyInfo> getList(int page) {
		MemberAccompanyInfoDao accInfoDao = sqlSession.getMapper(MemberAccompanyInfoDao.class);
		return accInfoDao.getList(page);
	}

	@Override
	public int delete(String id) {
		MemberAccompanyInfoDao accInfoDao = sqlSession.getMapper(MemberAccompanyInfoDao.class);
		return accInfoDao.delete(id);
	}

	@Override
	public int add(MemberAccompanyInfo memberAccompanyInfo) {
		MemberAccompanyInfoDao accInfoDao = sqlSession.getMapper(MemberAccompanyInfoDao.class);
		return accInfoDao.add(memberAccompanyInfo);
	}

	@Override
	public int update(MemberAccompanyInfo memberAccompanyInfo) {
		MemberAccompanyInfoDao accInfoDao = sqlSession.getMapper(MemberAccompanyInfoDao.class);
		return accInfoDao.update(memberAccompanyInfo);
	}

	@Override
	public int count() {
		MemberAccompanyInfoDao accInfoDao = sqlSession.getMapper(MemberAccompanyInfoDao.class);
		return accInfoDao.count();
	}


}

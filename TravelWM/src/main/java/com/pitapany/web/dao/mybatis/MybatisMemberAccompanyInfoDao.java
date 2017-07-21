package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.AccompanyBoardDao;
import com.pitapany.web.dao.CommunityTipDao;
import com.pitapany.web.dao.MemberAccompanyInfoDao;
import com.pitapany.web.dao.MemberAccompanyMatchDao;
import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.MemberAccompanyInfo;
import com.pitapany.web.entity.MemberAccompanyInfoMatchingView;
import com.pitapany.web.entity.MemberProfInfoMatchingResultView;

public class MybatisMemberAccompanyInfoDao implements MemberAccompanyInfoDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public MemberAccompanyInfo get(String id) {
		MemberAccompanyInfoDao accInfoDao = sqlSession.getMapper(MemberAccompanyInfoDao.class);
		return accInfoDao.get(id);
	}

	@Override
	public List<MemberAccompanyInfo> getList(String memberId) {
		MemberAccompanyInfoDao accInfoDao = sqlSession.getMapper(MemberAccompanyInfoDao.class);
		return accInfoDao.getList(memberId);
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



	@Override
	public MemberProfInfoMatchingResultView getMatchingResult(String memberAccomInfoId) {
		MemberAccompanyInfoDao accInfoDao = sqlSession.getMapper(MemberAccompanyInfoDao.class);
		return accInfoDao.getMatchingResult(memberAccomInfoId);
	}

	@Override
	public List<MemberAccompanyInfoMatchingView> getListMemberAccompanyMatching(float latitude, float longitude,
			String memberId, String styleEq, String styleId, String distance, String sexEq, String sex, int minAge,
			int maxAge) {
		MemberAccompanyInfoDao accInfoDao = sqlSession.getMapper(MemberAccompanyInfoDao.class);
		return accInfoDao.getListMemberAccompanyMatching(latitude, longitude, memberId, styleEq, styleId, distance, sexEq, sex, minAge, maxAge);
	}
	

	@Override
	public List<MemberProfInfoMatchingResultView> getMatchedListByMemberId(String memberId) {
		MemberAccompanyInfoDao accInfoDao = sqlSession.getMapper(MemberAccompanyInfoDao.class);
		return accInfoDao.getMatchedListByMemberId(memberId);
	}

	@Override
	public int deleteAll(String memberId) {
		MemberAccompanyInfoDao accInfoDao = sqlSession.getMapper(MemberAccompanyInfoDao.class);
		return accInfoDao.deleteAll(memberId);
	}


}

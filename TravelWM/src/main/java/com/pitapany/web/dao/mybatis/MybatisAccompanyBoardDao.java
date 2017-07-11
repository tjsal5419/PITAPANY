package com.pitapany.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.pitapany.web.dao.AccompanyBoardDao;
import com.pitapany.web.dao.CommunityTipDao;
import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.AccompanyBoardView;

public class MybatisAccompanyBoardDao implements AccompanyBoardDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public AccompanyBoard get(String id) {
		AccompanyBoardDao accBoardDao = sqlSession.getMapper(AccompanyBoardDao.class);
		return accBoardDao.get(id);
	}

	@Override
	public List<AccompanyBoardView> getList(int page) {
		AccompanyBoardDao accBoardDao = sqlSession.getMapper(AccompanyBoardDao.class);
		return accBoardDao.getList(page);
	}

	@Override
	public int delete(String id) {
		AccompanyBoardDao accBoardDao = sqlSession.getMapper(AccompanyBoardDao.class);
		return accBoardDao.delete(id);
	}

	@Override
	public int add(AccompanyBoard accompanyBoard) {
		AccompanyBoardDao accBoardDao = sqlSession.getMapper(AccompanyBoardDao.class);
		return accBoardDao.add(accompanyBoard);
	}

	@Override
	public int update(AccompanyBoard accompanyBoard) {
		AccompanyBoardDao accBoardDao = sqlSession.getMapper(AccompanyBoardDao.class);
		return accBoardDao.update(accompanyBoard);
	}

	@Override
	public int addHits(String id) {
		AccompanyBoardDao accBoardDao = sqlSession.getMapper(AccompanyBoardDao.class);
		return accBoardDao.addHits(id);
	}

	@Override
	public int count() {
		AccompanyBoardDao accBoardDao = sqlSession.getMapper(AccompanyBoardDao.class);
		return accBoardDao.count();
	}

	@Override
	public List<AccompanyBoardView> getMainList() {
		AccompanyBoardDao accBoardDao = sqlSession.getMapper(AccompanyBoardDao.class);
		return accBoardDao.getMainList();
	}

	@Override
	public AccompanyBoardView getView(String id) {
		AccompanyBoardDao accBoardDao = sqlSession.getMapper(AccompanyBoardDao.class);
		return accBoardDao.getView(id);
	}

	@Override
	public List<AccompanyBoardView> getListBySexAgeStyle(String styleComp, String styleId, int minAge, int maxAge,
			String sex, int page) {
		AccompanyBoardDao accBoardDao = sqlSession.getMapper(AccompanyBoardDao.class);
		return accBoardDao.getListBySexAgeStyle(styleComp, styleId, minAge, maxAge, sex, page);
	}

	@Override
	public int countBySexAgeStyle(String styleComp, String styleId, int minAge, int maxAge, String sex) {
		AccompanyBoardDao accBoardDao = sqlSession.getMapper(AccompanyBoardDao.class);
		return accBoardDao.countBySexAgeStyle(styleComp, styleId, minAge, maxAge, sex);
	}

	@Override
	public List<AccompanyBoardView> getListByLocationDate(String latitude, String longitude, String startDate,
			String endDate, int page, String styleComp, String styleId, int minAge, int maxAge, String sex) {
		AccompanyBoardDao accBoardDao = sqlSession.getMapper(AccompanyBoardDao.class);
		return accBoardDao.getListByLocationDate(latitude, longitude, startDate, endDate, page, styleComp, styleId, minAge, maxAge, sex);
	}

	@Override
	public int countByLocationDate(String latitude, String longitude, String startDate, String endDate,
			String styleComp, String styleId, int minAge, int maxAge, String sex) {
		AccompanyBoardDao accBoardDao = sqlSession.getMapper(AccompanyBoardDao.class);
		return accBoardDao.countByLocationDate(latitude, longitude, startDate, endDate, styleComp, styleId, minAge, maxAge, sex);
	}

}

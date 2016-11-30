package com.online.shop.persistence;


import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.online.shop.domain.BuyerVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;


@Repository
public class BuyerDAOImple implements BuyerDAO {

	private static final String NAMESPACE = "com.online.shop.ShopMapper";
	
	private static Logger logger = LoggerFactory.getLogger(BuyerDAOImple.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BuyerVO> select() {
		List<BuyerVO> list = sqlSession.selectList(NAMESPACE + ".buyerSelectAll");
		logger.info("select() 호출:" + list.size());
		
		return list;
	}
	
	
	@Override
	public int getNumOfRecords() {
		return sqlSession.selectOne(NAMESPACE + ".totalCount");
	}
	
	@Override
	public List<BuyerVO> select(PageCriteria cri) {
		return sqlSession.selectList(NAMESPACE + ".listPage", cri);
	}
	
	@Override
	public List<BuyerVO> listSearch(SearchPageCriteria crit) {
		List<BuyerVO> list = sqlSession.selectList(NAMESPACE + ".listSearch", crit);
		logger.info("SearchCriteria list: " + list.size());
			return list;
	} 
	
	@Override
	public int listSearchCount(SearchPageCriteria crit) {		
		return sqlSession.selectOne(NAMESPACE + ".listSearchCount", crit);
	}
	

	
}

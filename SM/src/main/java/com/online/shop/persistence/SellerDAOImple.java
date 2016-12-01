package com.online.shop.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.online.shop.domain.SellerVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;

@Repository
public class SellerDAOImple implements SellerDAO {

	private static final String NAMESPACE = "com.online.shop.ShopMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(SellerDAOImple.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SellerVO> select() {
		List<SellerVO> list =  sqlSession.selectList(NAMESPACE + ".sellerSelectAll");
		logger.info("select() 호출: " + list.size());
				
		return list;
	}
	
	@Override
	public int getNumOfRecords() {
		return sqlSession.selectOne(NAMESPACE + ".sellerTotalCount") ;
	}
		
	@Override
	public List<SellerVO> select(PageCriteria cri) {
		return sqlSession.selectList(NAMESPACE + ".sellerListPage", cri);
	}
	
	@Override
	public List<SellerVO> listSearch(SearchPageCriteria cri) { 
		return sqlSession.selectList(NAMESPACE + ".searchListSearch", cri);
	}
	
	@Override
	public int listSearchCount(SearchPageCriteria cri) {
		return sqlSession.selectOne(NAMESPACE + ".sellerListSearchCount", cri);
	}
	
	@Override
	public List<SellerVO> selectAccess() {
		return sqlSession.selectList(NAMESPACE + ".selectAccess");
	}

}

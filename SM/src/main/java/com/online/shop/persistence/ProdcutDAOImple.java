package com.online.shop.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.online.shop.domain.ProductVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;

@Repository
public class ProdcutDAOImple implements ProductDAO {

	private static final String NAMESPACE = "com.online.shop.ShopMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(ProdcutDAOImple.class);
	
	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public List<ProductVO> select() {
		List<ProductVO> list = sqlSession.selectList(NAMESPACE + ".productSelectAll");
		logger.info("select() 호출:" + list.size());
		
		return list;
	}
	
	@Override
	public int getNumOfRecords() {
		return sqlSession.selectOne(NAMESPACE + ".productTotalCount");
	}
	
	@Override
	public List<ProductVO> select(PageCriteria cri) {
		return sqlSession.selectList(NAMESPACE + ".productListPage", cri);
	}
	
	@Override
	public int listSearchCount(SearchPageCriteria cri) {
		return sqlSession.selectOne(NAMESPACE + ".productListSearchCount", cri);
	}
	
	@Override
	public List<ProductVO> select(SearchPageCriteria cri) {
		return sqlSession.selectList(NAMESPACE + ".productListSearch", cri);
	}
	
	

}

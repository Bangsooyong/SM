package com.online.shop.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.online.shop.domain.BuyVO;
import com.online.shop.domain.CartVO;

@Repository
public class AdminDAOImple implements AdminDAO {

	private static final String NAMEPACE = "com.online.shop.AdminMapper";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BuyVO> selectByBuy() {
		return sqlSession.selectList(NAMEPACE+".selectByBuy");
	}
	
	@Override
	public List<BuyVO> selectByBuy2() {
		return sqlSession.selectList(NAMEPACE+".selectByBuy2");
	}
	
	@Override
	public List<BuyVO> selectByBuyr() {
		return sqlSession.selectList(NAMEPACE+".selectByBuyr");
	}
	
	@Override
	public List<BuyVO> selectByBuyf() {
		return sqlSession.selectList(NAMEPACE+".selectByBuyf");
	}

	@Override
	public List<BuyVO> selectByBuyRequest() {
		return sqlSession.selectList(NAMEPACE+".selectByBuyRequest");
	}
	
	@Override
	public List<BuyVO> selecyByBuyToday(String today) {
		return sqlSession.selectList(NAMEPACE+".selectByBuyToday", today);
	}
	
}

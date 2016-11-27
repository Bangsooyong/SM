package com.spring.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.domain.BuyVO;
import com.spring.domain.CartVO;

@Repository
public class AdminDAOImple implements AdminDAO {

	private static final String NAMEPACE = "com.spring.shop.AdminMapper";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectBySeller() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertProduct() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertImage() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertOption() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectByProduct() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectByImage() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertCart() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CartVO> selectByCart() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBuy() {
		// TODO Auto-generated method stub
		return 0;
	}

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

}

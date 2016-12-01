package com.online.shop.persistence;

import java.util.List;

import com.online.shop.domain.BuyVO;
import com.online.shop.domain.CartVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;

public interface AdminDAO {
	public abstract int selectBySeller();
	public abstract int insertProduct();
	public abstract int insertImage();
	public abstract int insertOption();
	public abstract int selectByProduct();
	public abstract int selectByImage();	
	public abstract int insertCart();
	public abstract List<CartVO> selectByCart();
	public abstract int insertBuy();
	public abstract List<BuyVO> selectByBuy();
	public abstract List<BuyVO> selectByBuy2();
	public abstract List<BuyVO> selectByBuyr();
	public abstract List<BuyVO> selectByBuyf();
	// 주문 요청 내역 페이징 처리를 위한 dao
	public abstract List<BuyVO> selectByBuyr(PageCriteria cri);
	// 주문 요청 내역 전체 레코드수 세는 dao
	public abstract int getNumOfRecordsBuyr();
	// 주문 요청 내역 검색 처리를 위한 dao
	public abstract List<BuyVO> selectByBuyr(SearchPageCriteria cri);
	// 주문 요청 내역 검색 레코드수 세는 dao
	public abstract int getNumOfSearchRecordsBuyr(SearchPageCriteria cri);
	// 전체 판매 내역 페이징 처리를 위한 dao
	public abstract List<BuyVO> selectByBuyf(PageCriteria cri);
	// 전체 판매 내역 전체 레코드수 세는 dao
	public abstract int getNumOfRecordsBuyf();
	
}

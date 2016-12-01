package com.online.shop.persistence;

import java.util.List;

import com.online.shop.domain.BuyVO;
import com.online.shop.domain.CartVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;

public interface AdminDAO {
	public abstract List<BuyVO> selectByBuy();
	public abstract List<BuyVO> selectByBuy2();
	public abstract List<BuyVO> selectByBuyr();
	public abstract List<BuyVO> selectByBuyf();

	public abstract List<BuyVO> selectByBuyRequest();
	public abstract List<BuyVO> selecyByBuyToday(String buy_date);

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

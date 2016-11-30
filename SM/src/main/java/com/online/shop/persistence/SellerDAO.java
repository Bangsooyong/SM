package com.online.shop.persistence;

import java.util.List;

import com.online.shop.domain.SellerVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;

public interface SellerDAO {
	// 리스트를 받아오기 위한 select문
	public abstract List<SellerVO> select();
	// 전체 페이지수를 계산하기 위해서
	public abstract int getNumOfRecords();
	// paging 처리를 위한 select문
	public abstract List<SellerVO> select(PageCriteria cri);
	// 검색 기능을 위한 select문
	public abstract List<SellerVO> listSearch(SearchPageCriteria cri);
	// 검색 후 paging 처리를 위한 전체 페이지 계산
	public int listSearchCount(SearchPageCriteria cri);
	
	
	
}

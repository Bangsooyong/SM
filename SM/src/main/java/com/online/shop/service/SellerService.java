package com.online.shop.service;

import java.util.List;

import com.online.shop.domain.SellerVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;

public interface SellerService {
	// 판매자 목록을 불러오기 위한 service
	public abstract List<SellerVO> read();
	// 판매자 목록 페이징 처리를 위한 service
	public abstract List<SellerVO> read(PageCriteria cri);
	// 판매자 목록 총 갯수를 세기 위한 service
	public abstract int getNumOfRecords();
	// 판매자 목록 검색을 위한 service
	public abstract List<SellerVO> listSearchCriteria(SearchPageCriteria cri);
	// 판매자 목록 검색 페이지수를 세기 위한 service
	public abstract int listSearchCount(SearchPageCriteria cri);

	//미승인 판매자 검색
	public abstract List<SellerVO> searchAccess();
}

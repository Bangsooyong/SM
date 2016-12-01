package com.online.shop.service;

import java.util.List;

import com.online.shop.domain.ProductVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;

public interface ProductService {
	// 판매물 목록을 불러오는 service
	public abstract List<ProductVO> read();
	// 판매물 목록을 페이징 처리를 위한 service
	public abstract List<ProductVO> read(PageCriteria cri);
	// 판매물 목록의 총 갯수를 세는 service
	public abstract int getNumOfRecords ();
	// 판매물 검색 처리를 위한 service
	public abstract List<ProductVO> listSearchCriteria(SearchPageCriteria cri);
	// 판매물 검색 목록의 갯수를 세는 service
	public abstract int listSearchCount(SearchPageCriteria cri);

}

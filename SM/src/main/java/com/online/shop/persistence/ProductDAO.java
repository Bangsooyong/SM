package com.online.shop.persistence;

import java.util.List;

import com.online.shop.domain.ProductVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;

public interface ProductDAO {
	// 전체 검색을 위한 select문
	public abstract List<ProductVO> select();

	public abstract List<ProductVO> selectAcc();

	// 페이징 처리가 되는 select문
	public abstract List<ProductVO> select(PageCriteria cri);
	// 페이징 처리를 위한 전체 페이지수 검색
	public abstract int getNumOfRecords();
	// 검색 기능이 되는 select문
	public abstract List<ProductVO> select(SearchPageCriteria cri);
	// 검색후 페이징 처리를 위한 전체 페이지수 검색
	public abstract int listSearchCount(SearchPageCriteria cri);
	
	// 승인 처리
	public abstract int update(int pno);

	
}

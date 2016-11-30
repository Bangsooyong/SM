package com.online.shop.service;

import java.util.List;

import com.online.shop.domain.BuyerVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;

public interface BuyerService {

	public abstract List<BuyerVO> read();

	public abstract List<BuyerVO> read(PageCriteria cri);

	public abstract int getNumOfRecords();
	
	public abstract List<BuyerVO> listSearchCriteria(SearchPageCriteria cri);
	
	public abstract int listSearchCount(SearchPageCriteria cri);
	
	
}

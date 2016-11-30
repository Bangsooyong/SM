package com.online.shop.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.online.shop.domain.BuyerVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;
import com.online.shop.persistence.BuyerDAO;

@Service
public class BuyerServiceImple implements BuyerService {

	@Autowired
	private BuyerDAO buyerDao;
	
	@Override
	public List<BuyerVO> read() {
		return buyerDao.select();
	}
	
	@Override
	public int getNumOfRecords() {
		return buyerDao.getNumOfRecords();
	}
	
	@Override
	public List<BuyerVO> read(PageCriteria cri) {
		return buyerDao.select(cri);
	}

	@Override
	public int listSearchCount(SearchPageCriteria cri) {
		return buyerDao.listSearchCount(cri);
	}
	
	@Override
	public List<BuyerVO> listSearchCriteria(SearchPageCriteria cri) {
		return buyerDao.listSearch(cri);
	}
	
}

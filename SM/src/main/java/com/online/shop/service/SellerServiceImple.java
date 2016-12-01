package com.online.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.online.shop.domain.SellerVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;
import com.online.shop.persistence.SellerDAO;

@Service
public class SellerServiceImple implements SellerService {

	@Autowired
	private SellerDAO sellerDao;
	
	@Override
	public List<SellerVO> read() {
		return sellerDao.select();
	}
	
	@Override
	public int getNumOfRecords() {
		return sellerDao.getNumOfRecords();
	}
	
	@Override
	public List<SellerVO> read(PageCriteria cri) {
		return sellerDao.select(cri);
	}
	
	@Override
	public List<SellerVO> listSearchCriteria(SearchPageCriteria cri) {
		return sellerDao.listSearch(cri);
	}
	
	@Override
	public int listSearchCount(SearchPageCriteria cri) {
		return sellerDao.listSearchCount(cri);
	}

	@Override
	public List<SellerVO> searchAccess() {
		return sellerDao.selectAccess();
	}
	
}

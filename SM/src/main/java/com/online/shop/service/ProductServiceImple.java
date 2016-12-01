package com.online.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.online.shop.domain.ProductVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.SearchPageCriteria;
import com.online.shop.persistence.ProductDAO;

@Service
public class ProductServiceImple implements ProductService {

	@Autowired
	private ProductDAO productDao;
	
	@Override
	public List<ProductVO> read() {
		return productDao.select();
	}
	
	@Override
	public int getNumOfRecords() {
		return productDao.getNumOfRecords();
	}
	
	@Override
	public List<ProductVO> read(PageCriteria cri) {
		return productDao.select(cri);
	}
	
	@Override
	public int listSearchCount(SearchPageCriteria cri) {
		return productDao.listSearchCount(cri);
	}
	
	@Override
	public List<ProductVO> listSearchCriteria(SearchPageCriteria cri) {
		return productDao.select(cri);
	}

}

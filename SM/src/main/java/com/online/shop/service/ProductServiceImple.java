package com.online.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.online.shop.domain.ProductVO;
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
	public List<ProductVO> selectAcc() {
		return productDao.selectAcc();
	}

}

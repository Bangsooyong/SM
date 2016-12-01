package com.online.shop.service;

import java.util.List;

import com.online.shop.domain.ProductVO;

public interface ProductService {
	
	public abstract List<ProductVO> read();
	public abstract List<ProductVO> selectAcc();

}

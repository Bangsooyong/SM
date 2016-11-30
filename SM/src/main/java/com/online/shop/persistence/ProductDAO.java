package com.online.shop.persistence;

import java.util.List;

import com.online.shop.domain.ProductVO;

public interface ProductDAO {
	
	public abstract List<ProductVO> select();
	
}

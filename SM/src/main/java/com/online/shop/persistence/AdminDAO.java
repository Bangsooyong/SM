package com.online.shop.persistence;

import java.util.List;

import com.online.shop.domain.BuyVO;
import com.online.shop.domain.CartVO;

public interface AdminDAO {
	public abstract int selectBySeller();
	public abstract int insertProduct();
	public abstract int insertImage();
	public abstract int insertOption();
	public abstract int selectByProduct();
	public abstract int selectByImage();	
	public abstract int insertCart();
	public abstract List<CartVO> selectByCart();
	public abstract int insertBuy();
	public abstract List<BuyVO> selectByBuy();
	public abstract List<BuyVO> selectByBuy2();
	public abstract List<BuyVO> selectByBuyr();
	public abstract List<BuyVO> selectByBuyf();
}

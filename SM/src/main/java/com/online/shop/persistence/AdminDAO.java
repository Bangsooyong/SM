package com.online.shop.persistence;

import java.util.List;

import com.online.shop.domain.BuyVO;
import com.online.shop.domain.CartVO;

public interface AdminDAO {
	public abstract List<BuyVO> selectByBuy();
	public abstract List<BuyVO> selectByBuy2();
	public abstract List<BuyVO> selectByBuyr();
	public abstract List<BuyVO> selectByBuyf();
	public abstract List<BuyVO> selectByBuyRequest();
	public abstract List<BuyVO> selecyByBuyToday(String buy_date);
}

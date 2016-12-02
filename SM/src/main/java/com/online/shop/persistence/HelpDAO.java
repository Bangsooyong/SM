package com.online.shop.persistence;

import java.util.List;

import com.online.shop.domain.helpVO;

public interface HelpDAO {
	public abstract int insertBoard(helpVO vo);
	public abstract List<helpVO> selectAll();
}

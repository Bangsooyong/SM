package com.online.shop.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.online.shop.domain.helpVO;

@Repository
public class HelpDAOImple implements HelpDAO {

	private static final String NAMESPACE = "com.online.shop.HelpMapper";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertBoard(helpVO vo) {
		return session.insert(NAMESPACE+".insert-help", vo);
	}
	
	@Override
	public List<helpVO> selectAll() {
		return session.selectList(NAMESPACE+".select-help");
	}
	
	@Override
	public helpVO helpDetail(int h_no) {
		return session.selectOne(NAMESPACE+".help-detail", h_no);
	}
	
}

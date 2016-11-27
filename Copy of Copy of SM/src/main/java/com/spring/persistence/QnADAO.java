package com.spring.persistence;

import java.util.List;

import com.spring.domain.QnaRVO;
import com.spring.domain.QnaVO;

public interface QnADAO {

	public abstract int insertQnA(QnaVO vo);
	public abstract List<QnaVO> selectQna(int p_no);
	public abstract int insertQnAR(QnaRVO vo);
/*	public abstract List<QnaRVO> selectQnaR(QnaVO vo);*/
	public abstract QnaRVO selectQnaR(QnaVO vo);
	public abstract int updateQnAR(QnaRVO vo);
	public abstract int deleteQnAR(QnaRVO vo);
}

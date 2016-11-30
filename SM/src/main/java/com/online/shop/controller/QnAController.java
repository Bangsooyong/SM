package com.online.shop.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.online.shop.domain.QnaRVO;
import com.online.shop.domain.QnaVO;
import com.online.shop.persistence.QnADAO;

@Controller
@RequestMapping(value="/board")
public class QnAController {
	
	@Autowired
	private QnADAO dao;
	
	@RequestMapping(value="qna", method=RequestMethod.GET)
	public void qndBoard(QnaVO vo, Model model) {
		int p_no = 0;
		//vo.setQna_no(1);
		List<QnaVO> list = dao.selectQna(p_no);
		//List<QnaRVO> listR = dao.selectQnaR(vo);
		List<QnaRVO> listR = new ArrayList<>();
		for(QnaVO volist : list) {
			if(volist.getQna_reply() == 1) {
			QnaRVO rvo = dao.selectQnaR(volist);
			listR.add(rvo);
			}
		}
		model.addAttribute("listQnA", list);
		model.addAttribute("listQnAR", listR);
	}

	
	@RequestMapping(value="insertQnA", method=RequestMethod.GET)
	public void insertQnA() {
		
	}
	
	@RequestMapping(value="insertQnA", method=RequestMethod.POST)
	public String insertQnAPOST(QnaVO vo) {

		int result = dao.insertQnA(vo);
		return "redirect:qna";
	}
	
	@RequestMapping(value="insertReply", method=RequestMethod.POST)
	public String insertReplyPost(QnaRVO vo) {
		//System.out.println(vo.getQna_r_cont() +"//" +vo.getS_id());
		//System.out.println(vo.getQna_no()+"//"+vo.getQna_reply());
		int result = dao.insertQnAR(vo);
		System.out.println("result cont:"+result);
		return "redirect:qna";
	}
	
	@RequestMapping(value="updateReply", method=RequestMethod.POST)
	public String updateReplyPOST(QnaRVO vo) {
		//System.out.println("updateReply//" + vo.getS_id()+"//"+vo.getQna_no()+"//"+vo.getQna_r_cont());
		int result = dao.updateQnAR(vo);
		System.out.println("result: " +result);
		return "redirect:qna";
	}
	
	@RequestMapping(value="deleteReply", method=RequestMethod.POST)
	public String deleteReplyPOST(QnaRVO vo) {
		//System.out.println("updateReply//" + vo.getS_id()+"//"+vo.getQna_no()+"//"+vo.getQna_r_cont());
		int result = dao.deleteQnAR(vo);
		System.out.println("result: " +result);
		return "redirect:qna";
	}
	
}

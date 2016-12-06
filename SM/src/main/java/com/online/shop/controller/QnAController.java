package com.online.shop.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.online.shop.domain.QnaRVO;
import com.online.shop.domain.QnaVO;
import com.online.shop.domain.ReviewRVO;
import com.online.shop.domain.ReviewVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.PageMaker;
import com.online.shop.persistence.QnADAO;
import com.online.shop.persistence.RevDAO;

@Controller
@RequestMapping(value="/board")
public class QnAController {
	
	@Autowired
	private QnADAO dao;
	
	@Autowired
	private RevDAO daoR;
	
	@RequestMapping(value="qna", method=RequestMethod.GET)
	public void qndBoard(Integer page, QnaVO vo, Model model) {
		System.out.println("page : " + page);
//		int p_no = 0; < - 페이징 처리하면서 의미가 없어진듯...;;
		//vo.setQna_no(1);
		
		// 페이지 criteria 생성자 만들기
		PageCriteria c = new PageCriteria();
		if (page != null){
			c.setPage(page);
		}
		
		List<QnaVO> list = dao.selectQna(c);
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
		
		// 페이지 메이커 생성
		PageMaker maker = new PageMaker();
		maker.setCrieria(c);
		maker.setTotalCount(dao.getNumOfRecordsQna());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);
	}
	
	
	//@RequestMapping(value="insertQnA", method=RequestMethod.GET)
	public void insertQnA() {
		
	}
	
	//@RequestMapping(value="insertReview", method=RequestMethod.GET)
	public void insertReview() {
		
	}
	
	//@RequestMapping(value="insertQnA", method=RequestMethod.POST)
	public void insertQnAPOST(QnaVO vo) {
		System.out.println("asdasd"+vo.getQna_cont());

		//int result = dao.insertQnA(vo);
		//return "redirect:qna";
	}
	
	
	//@RequestMapping(value="insertReply", method=RequestMethod.POST)
	public String insertReplyPost(QnaRVO vo, RedirectAttributes attr) {
		int result=0;

		if(!(vo.getQna_r_cont().equals(""))) {
			result = dao.insertQnAR(vo);
			System.out.println("result cont:"+result);
		} else{
			result = 0;
		}

		if (result == 1) {
			attr.addFlashAttribute("insert_reply", "success");
		} else {
			attr.addFlashAttribute("insert_reply", "fail");
		}
		
		return "redirect:qna";
	}
	
	//@RequestMapping(value="updateReply", method=RequestMethod.POST)
	public String updateReplyPOST(QnaRVO vo) {
		//System.out.println("updateReply//" + vo.getS_id()+"//"+vo.getQna_no()+"//"+vo.getQna_r_cont());
		int result = dao.updateQnAR(vo);
		System.out.println("result: " +result);
		return "redirect:qna";
	}
	
	//@RequestMapping(value="deleteReply", method=RequestMethod.POST)
	public String deleteReplyPOST(QnaRVO vo) {
		//System.out.println("updateReply//" + vo.getS_id()+"//"+vo.getQna_no()+"//"+vo.getQna_r_cont());
		int result = dao.deleteQnAR(vo);
		System.out.println("result: " +result);
		return "redirect:qna";
	}
	
}

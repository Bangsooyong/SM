package com.online.shop.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.online.shop.domain.QnaRVO;
import com.online.shop.domain.ReviewRVO;
import com.online.shop.domain.ReviewVO;
import com.online.shop.persistence.RevDAO;

@Controller
@RequestMapping(value = "/BoardRev")
public class ReviewController {

	@Autowired
	private RevDAO dao;
	
	@RequestMapping(value="review", method=RequestMethod.GET)
	public void reviewBoard(Model model) {
		int p_no = 0;
		
		List<ReviewVO>list = dao.selectRev(p_no);
		List<ReviewRVO> listR = new ArrayList<>();
		for(ReviewVO vo : list) {
			if(vo.getRev_reply() == 1) {
			ReviewRVO vo1 = dao.selectRevReply(vo.getRev_no());
			listR.add(vo1);
			
			}
		}
				
		model.addAttribute("listRev", list);
		model.addAttribute("listReply", listR);
	}
	
	@RequestMapping(value="insertReview", method=RequestMethod.GET)
	public void insertReview() {
		
	}
	
	@RequestMapping(value="insertReview", method=RequestMethod.POST)
	public String insertReviewPOST(ReviewVO vo) {
		System.out.println("vo: "+ vo.getRev_score());
		System.out.println("vo: " + vo.getRev_cont());
		
		int result = dao.insertRev(vo);
		System.out.println("insert 결과: "+result);
		
		return "redirect:review";
	}
	
	@RequestMapping(value="insertReply", method=RequestMethod.POST)
	public String insertReplyPost(ReviewRVO vo) {

		int result = dao.insertRevReply(vo);

		return "redirect:review";
	}
	
	
	@RequestMapping(value="updateReply", method=RequestMethod.POST)
	public String updateReplyPOST(ReviewRVO vo) {
		//System.out.println("updateReply//" + vo.getS_id()+"//"+vo.getQna_no()+"//"+vo.getQna_r_cont());
		int result = dao.updateRevReply(vo);
		System.out.println("result: " +result);
		return "redirect:qna";
	}
	
	@RequestMapping(value="deleteReply", method=RequestMethod.POST)
	public String deleteReplyPOST(ReviewRVO vo) {
		//System.out.println("updateReply//" + vo.getS_id()+"//"+vo.getQna_no()+"//"+vo.getQna_r_cont());
		int result = dao.deleteRevReply(vo);
		System.out.println("result: " +result);
		return "redirect:qna";
	}
	
}

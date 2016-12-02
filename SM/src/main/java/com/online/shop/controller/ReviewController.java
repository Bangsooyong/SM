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
import com.online.shop.domain.ReviewRVO;
import com.online.shop.domain.ReviewVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.PageMaker;
import com.online.shop.persistence.RevDAO;

@Controller
@RequestMapping(value = "/BoardRev")
public class ReviewController {

	@Autowired
	private RevDAO dao;
	
	@RequestMapping(value="review", method=RequestMethod.GET)
	public void reviewBoard(Integer page, Model model) {
//		int p_no = 0; <- 페이징 처리하면서 의미가 없어진듯...;;
		
		PageCriteria c = new PageCriteria();
		if (page != null){
			c.setPage(page);
		}
		
		List<ReviewVO>list = dao.selectRev(c);
		List<ReviewRVO> listR = new ArrayList<>();
		for(ReviewVO vo : list) {
			if(vo.getRev_reply() == 1) {
			ReviewRVO vo1 = dao.selectRevReply(vo.getRev_no());
			listR.add(vo1);
			
			}
		}
				
		model.addAttribute("listRev", list);
		model.addAttribute("listReply", listR);
		
		PageMaker maker = new PageMaker();
		maker.setCrieria(c);
		maker.setTotalCount(dao.getNumOfPageReview());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);
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
	public String insertReplyPost(ReviewRVO vo, RedirectAttributes attr) {

		//int result = dao.insertRevReply(vo);
		int result=0;
		if(!(vo.getRev_r_cont().equals(""))) {
			result = dao.insertRevReply(vo);
			System.out.println("result cont:"+result);
		} else{
			result = 0;
		}

		if (result == 1) {
			attr.addFlashAttribute("insert_reply", "success");
		} else {
			attr.addFlashAttribute("insert_reply", "fail");
		}

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

package com.online.shop.controller;

import javax.inject.Inject;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.PageMaker;
import com.online.shop.pageutil.SearchPageCriteria;
import com.online.shop.service.BuyerService;
import com.online.shop.service.SellerService;

@Controller
public class SearchController {

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Inject
	private BuyerService service;
	@Inject
	private SellerService sellerservice;
	
	
	// 구매자 회원 목록 콘트롤러(검색 기능 페이지)
	@RequestMapping(value="/admin/searchlist", method= RequestMethod.GET)
	public void searchList(@ModelAttribute("cri") SearchPageCriteria cri, Model model, Integer page){
		logger.info(cri.toString());
		logger.info("cri page=" + cri.getPage());
		logger.info("cir perPage=" + cri.getPerPage());
		logger.info("page:" + page);
		
		PageCriteria c = new PageCriteria();
		if (page != null) {
			c.setPage(page);
		}
		
		PageMaker maker = new PageMaker();
		maker.setCrieria(c);
		maker.setTotalCount(service.getNumOfRecords());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);

		model.addAttribute("buyerList", service.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCrieria(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));
		pageMaker.setPageData();
		
		model.addAttribute("searchpageMaker", pageMaker);
	}
	
	@RequestMapping(value="/admin/seller_accept_searchlist", method= RequestMethod.GET)
	public void sellersearchList(@ModelAttribute("cri") SearchPageCriteria cri, Model model, Integer page){
		logger.info(cri.toString());
		logger.info("cri page=" + cri.getPage());
		logger.info("cir perPage=" + cri.getPerPage());
		logger.info("page:" + page);
		
		PageCriteria c = new PageCriteria();
		if (page != null) {
			c.setPage(page);
		}
		
		PageMaker maker = new PageMaker();
		maker.setCrieria(c);
		maker.setTotalCount(sellerservice.getNumOfRecords());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);

		model.addAttribute("sellerList", sellerservice.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCrieria(cri);
		pageMaker.setTotalCount(sellerservice.listSearchCount(cri));
		pageMaker.setPageData();
		
		model.addAttribute("searchpageMaker", pageMaker);
		
		
	}
	
}

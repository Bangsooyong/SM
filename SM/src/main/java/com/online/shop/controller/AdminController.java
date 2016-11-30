package com.online.shop.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.online.shop.domain.BuyerVO;
import com.online.shop.domain.ProductVO;
import com.online.shop.domain.SellerVO;
import com.online.shop.pageutil.PageCriteria;
import com.online.shop.pageutil.PageMaker;

import com.online.shop.service.BuyerService;
import com.online.shop.service.ProductService;
import com.online.shop.service.SellerService;
import com.online.shop.domain.BuyVO;
import com.online.shop.persistence.AdminDAO;

@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	// Serivce 객체 주입
	@Autowired
	private SellerService sellerservice;
	@Autowired
	private ProductService productservice;
	@Autowired
	private BuyerService buyerservice;
	@Autowired
	private AdminDAO dao;
	

	// 메인 jsp 콘트롤러
	@RequestMapping(value = "/admin/seller_admin_main", method = RequestMethod.GET)
	public void listSeller(Model model) {
		logger.info("listSeller() 호출...");

		List<SellerVO> list = sellerservice.read();
		model.addAttribute("sellerList", list);

	}

	// 관리자 마이페이지 콘트롤러
	@RequestMapping(value = "/admin/admin_mypage", method = RequestMethod.GET)
	public void adminMypage(Model model) {
		List<BuyVO> list = dao.selectByBuy();
		List<BuyVO> list2 = dao.selectByBuy2();
		model.addAttribute("listBuyVO", list);
		model.addAttribute("list2", list2);

	}
	
	// 주문 요청 내역 콘트롤러
	@RequestMapping(value="/admin/buyr", method = RequestMethod.GET)
	public void adminBuyReq(Model model) {
		List<BuyVO> list = dao.selectByBuyr();
		model.addAttribute("list", list);
	}
	
	// 전체 판매 내역 콘트롤러
	@RequestMapping(value="/admin/buyf", method = RequestMethod.GET)
	public void adminBuyfin(Model model) {
		List<BuyVO> list = dao.selectByBuyf();
		model.addAttribute("list", list);
	}

	// 판매자 가입 승인 요청 내역 콘트롤러
	@RequestMapping(value = "/admin/seller_accept_list", method = RequestMethod.GET)
	public void acceptPage(Integer page, Model model) {
		logger.info("page : " + page);
		
		PageCriteria c = new PageCriteria();
		if (page != null) {
			c.setPage(page);
		}
		
		List<SellerVO> list = sellerservice.read(c);
		
		model.addAttribute("sellerList", list);
		
		PageMaker maker = new PageMaker();
		maker.setCrieria(c);
		maker.setTotalCount(sellerservice.getNumOfRecords());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);
	
	}

	// 판매물 등록 승인 콘트롤러
	@RequestMapping(value = "/admin/seller_accept_product_list", method = RequestMethod.GET)
	public void acceptProductPage(Model model) {
		List<ProductVO> list = productservice.read(); 
		List<SellerVO> list1 = sellerservice.read();

		logger.info("list size=" + list.size());
		logger.info("list1 size=" + list1.size());
		logger.info(list.get(0).getP_name());
		logger.info(list1.get(0).getS_no() + "");

		model.addAttribute("prodcutList", list);
		model.addAttribute("sellerList", list1);
	}

	// 구매자 회원 목록 콘트롤러(페이징 페이지)
	@RequestMapping(value="/admin/listview", method = RequestMethod.GET)
	public void listAll(Integer page, Model model) {
		logger.info("listPage(): page=" + page);
		
		PageCriteria c = new PageCriteria();
		if (page != null) {
			c.setPage(page);
		}
		
		List<BuyerVO> list = buyerservice.read(c);
		
		model.addAttribute("buyerList", list);
		
		PageMaker maker = new PageMaker();
		maker.setCrieria(c);
		maker.setTotalCount(buyerservice.getNumOfRecords());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);
		
		
		
	}
	
	
}

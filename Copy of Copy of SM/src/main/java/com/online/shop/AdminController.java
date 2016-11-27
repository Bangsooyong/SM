package com.online.shop;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.domain.BuyVO;
import com.spring.persistence.AdminDAO;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminDAO dao;
	
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public void adminMypage(Model model) {
		List<BuyVO> list = dao.selectByBuy();
		List<BuyVO> list2 = dao.selectByBuy2();
		model.addAttribute("listBuyVO", list);
		model.addAttribute("list2", list2);
	}
	
	@RequestMapping(value="buyr", method = RequestMethod.GET)
	public void adminBuyReq(Model model) {
		List<BuyVO> list = dao.selectByBuyr();
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="buyf", method = RequestMethod.GET)
	public void adminBuyfin(Model model) {
		List<BuyVO> list = dao.selectByBuyf();
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="total", method = RequestMethod.GET)
	public void adminBuyTotal(Model model) {
	}
	
}

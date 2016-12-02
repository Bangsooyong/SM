package com.online.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.online.shop.domain.helpVO;
import com.online.shop.persistence.HelpDAO;

@Controller
@RequestMapping(value="/help")
public class HelpController {
	
	@Autowired
	private HelpDAO dao;

	@RequestMapping(value="mainlist")
	public void helpMain(Model model) {
		List<helpVO> list = dao.selectAll();
		model.addAttribute("helpList", list);
	}
	
	@RequestMapping(value="register")
	public void register() {
		
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String registerPost(helpVO vo, RedirectAttributes attr) {
		//System.out.println(vo.getH_title());
		//int result = dao.insertBoard(vo);	
		int result=0;

		if(!(vo.getH_content().equals("") && vo.getH_title().equals("") && vo.getH_userid().equals(""))) {
			result = dao.insertBoard(vo);
			System.out.println("result cont:"+result);
		} else{
			result = 0;
		}

		if (result == 1) {
			attr.addFlashAttribute("insert_result", "success");
		} else {
			attr.addFlashAttribute("insert_result", "fail");
		}
		
		return "redirect:mainlist";
	}
	
	@RequestMapping(value="detail")
	public void helpDatail(int h_no, Model model) {
		helpVO vo = dao.helpDetail(h_no);
		model.addAttribute("vo", vo);
	}
	
}

package com.online.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/help")
public class HelpController {

	@RequestMapping(value="boardhelp")
	public void helpMain() {
		
	}
	
	@RequestMapping(value="register")
	public void register() {
		
	}
	
}

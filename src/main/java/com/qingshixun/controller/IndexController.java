package com.qingshixun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	/**
	 * ½øÈëÊ×Ò³
	 * @return
	 */
	@RequestMapping("/index")
	public String userIndex(){
		return "index";
	}
	
	
}

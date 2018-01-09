package com.qingshixun.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.qingshixun.model.Hobby;
import com.qingshixun.model.Page;
import com.qingshixun.model.Profession;
import com.qingshixun.model.Result;
import com.qingshixun.model.Hobby;
import com.qingshixun.service.IHobbyService;

@Controller
@RequestMapping("/hobbys")
public class HobbyController {

	@Autowired
	private IHobbyService hobbyService;
	/**
	 * 查询所有用户信息
	 * 
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public String saveHobby(@ModelAttribute Hobby hobby){
		try {
			hobbyService.saveHobby(hobby);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return "success";
		
	}

	/**
	 * 查询所有用户信息
	 * 
	 * @return
	 */
	@RequestMapping("/list")
	public String showHobby(Model model,@RequestParam("currentPage")int currentPage) {
		Page page=new Page();
		page.setEveryPage(5);
		page.setCurrentPage(currentPage);
		Result result = hobbyService.getAll(page);
		model.addAttribute("page", result.getPage());
		model.addAttribute("hobbys",result.getList());
		return "hobbys/manage/list";
	}

	/**
	 * 进入添加页面
	 * 并查询出职业和爱好
	 * @return
	 */
	@RequestMapping("/add")
	public String toAddHobby(Model model,@RequestParam("hobbyId")int hobbyId) {
	
	
		model.addAttribute("hobby", hobbyService.getHobby(hobbyId));
		return "hobbys/content/add";
	}

	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public String deleteHobby(@RequestParam("hobbyId")int hobbyId){
		hobbyService.deleteHobby(hobbyId);
		return "success";
	}

}

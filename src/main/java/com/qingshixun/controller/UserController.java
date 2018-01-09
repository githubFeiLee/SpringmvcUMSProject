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
import com.qingshixun.model.User;
import com.qingshixun.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService userService;
	
	

	@RequestMapping("/save")
	@ResponseBody
	public String saveUser(@ModelAttribute User user, HttpServletRequest request, MultipartFile imageFile){
		String filePath = request.getServletContext().getRealPath("/")+"file/";
		//文件名
		String fileName = imageFile.getOriginalFilename();
		//创建文件目录
		File file =new File(filePath+fileName);
		file.mkdirs();
		//转存文件
		try {
			imageFile.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		user.setImageName(fileName);
		
		try {
			userService.saveUser(user);
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
	public String showUser(Model model,@RequestParam("currentPage")int currentPage) {
		Page page=new Page();
		page.setEveryPage(5);
		page.setCurrentPage(currentPage);
		Result result = userService.getAll(page);
		model.addAttribute("page", result.getPage());
		model.addAttribute("users",result.getList());
		return "users/manage/list";
	}

	/**
	 * 进入添加页面
	 * 并查询出职业和爱好
	 * @return
	 */
	@RequestMapping("/add")
	public String toAddUser(Model model,@RequestParam("userId")int userId) {
		List<Hobby> listHobby=userService.getHobby();
		model.addAttribute("listHobby", listHobby);
		List<Profession> listProfession=userService.getProfession();
		model.addAttribute("listProfession", listProfession);
		model.addAttribute("user", userService.getUser(userId));
		return "users/content/add";
	}

	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public String deleteUser(@RequestParam("userId")int userId){
		userService.deleteUser(userId);
		return "success";
	}
}

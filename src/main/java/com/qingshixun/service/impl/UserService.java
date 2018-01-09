package com.qingshixun.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qingshixun.dao.IUserDao;
import com.qingshixun.model.Hobby;
import com.qingshixun.model.Page;
import com.qingshixun.model.PageUtil;
import com.qingshixun.model.Profession;
import com.qingshixun.model.Result;
import com.qingshixun.model.User;
import com.qingshixun.service.IUserService;

@Service("userService")
@Transactional
public class UserService implements IUserService {

	@Autowired
	private IUserDao userDao;
	
	@Override
	public void saveUser(User user) {
		userDao.saveUser(user);
	}

	@Override
	public List<Hobby> getHobby() {
		return userDao.getHobby();
	}

	@Override
	public List<Profession> getProfession() {
		
		return userDao.getProfession();
	}

	@Override
	public List<User> grtUsers() {
		return null;
	
	}

	@Override
	public User getUser(int userId) {
		if(userId==-1){
			return new User();
		}else{
			return userDao.getUser(userId);
		}
	}

	@Override
	public void deleteUser(int userId) {
		userDao.deleteUser(userId);
	}

	@Override
	public Result getAll(Page page) {
		page = PageUtil.createPage(page, userDao.getAllUsers());
		List<User> users=userDao.getUsers(page);
		Result result = new Result();
		result.setList(users);
		result.setPage(page);
		return result;
	}

}

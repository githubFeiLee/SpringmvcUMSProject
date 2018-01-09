package com.qingshixun.service;

import java.util.List;

import com.qingshixun.model.Hobby;
import com.qingshixun.model.Page;
import com.qingshixun.model.Profession;
import com.qingshixun.model.Result;
import com.qingshixun.model.User;

public interface IUserService {
	void saveUser(User user);
	List<Hobby> getHobby();
	List<Profession> getProfession();
	List<User> grtUsers();
	Result getAll(Page page);
	User getUser(int userId);
	void deleteUser(int userId);
}

package com.qingshixun.dao;

import java.util.List;

import com.qingshixun.model.Hobby;
import com.qingshixun.model.Page;
import com.qingshixun.model.Profession;
import com.qingshixun.model.User;

public interface IUserDao {
	void saveUser(User user);
	List<Hobby> getHobby();
	List<Profession> getProfession();
	List<User> getUsers(Page page);
	int getAllUsers();
	User getUser(int userId);
	void deleteUser(int userId);
}

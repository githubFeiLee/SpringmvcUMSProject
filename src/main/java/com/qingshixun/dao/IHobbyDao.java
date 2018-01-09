package com.qingshixun.dao;

import java.util.List;

import com.qingshixun.model.Hobby;
import com.qingshixun.model.Page;

public interface IHobbyDao {

	void saveHobby(Hobby hobby);
	
	
	List<Hobby> getHobbys(Page page);
	int getAllHobbys();
	Hobby getHobby(int hobbyId);
	void deleteHobby(int hobbyId);
}

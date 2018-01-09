package com.qingshixun.service;

import java.util.List;

import com.qingshixun.model.Hobby;
import com.qingshixun.model.Page;
import com.qingshixun.model.Result;

public interface IHobbyService {
	void saveHobby(Hobby hobby);
	
	Result getAll(Page page);
	Hobby getHobby(int hobbyId);
	void deleteHobby(int hobbyId);
}

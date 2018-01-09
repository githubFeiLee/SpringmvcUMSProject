package com.qingshixun.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.qingshixun.dao.IHobbyDao;
import com.qingshixun.model.Hobby;
import com.qingshixun.model.Page;
import com.qingshixun.model.PageUtil;
import com.qingshixun.model.Profession;
import com.qingshixun.model.Result;
import com.qingshixun.model.Hobby;
import com.qingshixun.service.IHobbyService;

@Repository("hobbyService")
@Transactional
public class HobbyService implements IHobbyService {

	@Autowired
	private IHobbyDao hobbyDao;
	@Override
	public Result getAll(Page page) {
		page = PageUtil.createPage(page, hobbyDao.getAllHobbys());
		List<Hobby> hobbys=hobbyDao.getHobbys(page);
		Result result = new Result();
		result.setList(hobbys);
		result.setPage(page);
		return result;
	}
	@Override
	public void saveHobby(Hobby hobby) {
		hobbyDao.saveHobby(hobby);
	}

	

	

	@Override
	public Hobby getHobby(int hobbyId) {
		if(hobbyId==-1){
			return new Hobby();
		}else{
			return hobbyDao.getHobby(hobbyId);
		}
	}

	@Override
	public void deleteHobby(int hobbyId) {
		hobbyDao.deleteHobby(hobbyId);
	}
	

}

package com.qingshixun.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.qingshixun.dao.IHobbyDao;
import com.qingshixun.model.Hobby;
import com.qingshixun.model.Page;

@Repository("hobbyDao")
public class HobbyDao implements IHobbyDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Hobby> getHobbys(Page page) {
		Query query= sessionFactory.getCurrentSession().createQuery("FROM Hobby");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getEveryPage());
		return query.list();
	}

	@Override
	public void saveHobby(Hobby hobby) {
		Session session=sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(hobby);
		
	}

	
	public int getAllHobbys(){
		return sessionFactory.getCurrentSession().createQuery("FROM Hobby").list().size();
	}
	@Override
	public Hobby getHobby(int hobbyId) {
		Session session = sessionFactory.getCurrentSession();
		System.out.println((Hobby) session.load(Hobby.class, hobbyId));
		return (Hobby) session.load(Hobby.class, hobbyId);
	}
	@Override
	public void deleteHobby(int hobbyId) {
	
		sessionFactory.getCurrentSession().delete(sessionFactory.getCurrentSession().get(Hobby.class, hobbyId));
	}

}

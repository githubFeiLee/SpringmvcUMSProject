package com.qingshixun.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.qingshixun.dao.IUserDao;
import com.qingshixun.model.Hobby;
import com.qingshixun.model.Page;
import com.qingshixun.model.Profession;
import com.qingshixun.model.User;

@Repository("userDao")
public class UserDao implements IUserDao {

	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public void saveUser(User user) {
		Session session=sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(user);
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Hobby> getHobby() {
		Session session = sessionFactory.getCurrentSession();
		
		return session.createQuery("FROM Hobby").list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Profession> getProfession() {
		Session session = sessionFactory.getCurrentSession();

		return session.createQuery("FROM Profession").list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUsers(Page page) {
		Query query= sessionFactory.getCurrentSession().createQuery("FROM User");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getEveryPage());
		return query.list();
	}
	public int getAllUsers(){
		return sessionFactory.getCurrentSession().createQuery("FROM User").list().size();
	}
	@Override
	public User getUser(int userId) {
		Session session = sessionFactory.getCurrentSession();
		System.out.println((User) session.load(User.class, userId));
		return (User) session.load(User.class, userId);
	}
	@Override
	public void deleteUser(int userId) {
	
		sessionFactory.getCurrentSession().delete(sessionFactory.getCurrentSession().get(User.class, userId));
	}

}

package com.webapp.hibernate.dao;



import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.webapp.hibernate.model.User;
import com.webapp.hibernate.util.HIbernateUtil;

public class UserDao {

	
	public void saveUser(User user) {
		
		Transaction transaction = null;
		
		try(Session session = HIbernateUtil.getSessionFactory().openSession()) {
			// start transaction
			transaction = session.beginTransaction();
			// save the object
			session.save(user);
			// commit transaction
			transaction.commit();
			
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		
	}
	
	public User getbyId(int id) {
		

		try(Session session = HIbernateUtil.getSessionFactory().openSession()) {
			// load the object
			return (User) session.get(User.class,id);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<User> getList() {
		
		try(Session session = HIbernateUtil.getSessionFactory().openSession()) {
			// return the data to a list from database
			List<User> userslist ;
		    userslist = session.createQuery("select m from User m", User.class).list();
		    return userslist;
		    
		    
		    
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	
	
}


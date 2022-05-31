package com.webapp.hibernate.dao;



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
	
	
	
}


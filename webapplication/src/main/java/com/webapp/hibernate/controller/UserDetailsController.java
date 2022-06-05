package com.webapp.hibernate.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webapp.hibernate.dao.UserDao;
import com.webapp.hibernate.model.User;


@WebServlet ("/details")
public class UserDetailsController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private UserDao userDao;
	
	public void init() {
		userDao = new UserDao();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		        details(request, response);
		    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		        System.out.println("Details Done");
		        details(request, response);
		    }

	 private void details(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		 	
		    String id = request.getParameter("id");
		    int idInt = Integer.parseInt(id);
		    System.out.println(idInt);
	        User user = userDao.getbyId(idInt);
	        request.setAttribute("user", user);
        	request.getRequestDispatcher("/details.jsp").forward(request, response);
	       
	        
	 }
}

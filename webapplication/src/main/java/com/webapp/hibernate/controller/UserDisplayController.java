package com.webapp.hibernate.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webapp.hibernate.dao.UserDao;
import com.webapp.hibernate.model.User;

@WebServlet("/display")
public class UserDisplayController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDao userDao;

	public void init() {
		userDao = new UserDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		display(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		display(request, response);
	}

	private void display(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		
		 List<User> userlist = userDao.getList(); 
		 request.setAttribute("userlist", userlist); 
		 RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp"); 
		 dispatcher.forward(request,response);
		 

	}
}

package com.webapp.hibernate.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webapp.hibernate.dao.UserDao;
import com.webapp.hibernate.model.User;


@WebServlet ("/register")
public class UserRegistrationController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private UserDao userDao;
	
	public void init() {
		userDao = new UserDao();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		        register(request, response);
		    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		        response.sendRedirect("index.jsp");
		    }

	 private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		 	String message = "";
		 	boolean valid = true;
		 	String name = request.getParameter("name");
	        if (name.matches(".*\\d.*") || name.length()<2 || name.length()>30) {
	        	message += "Please insert a valid name (Only Characters Allowed, between 2-30 characters)<br>";
	        	valid = false;
	        }
		 	String surname = request.getParameter("surname");
		 	 if (surname.matches(".*\\d.*") || surname.length()<2 || surname.length()>30) {
	        	message += "Please insert a valid surname (Only Characters Allowed, between 2-30 characters)<br>";
	        	valid = false;
	        }
	        String gender = request.getParameter("gender");
	        if (!gender.equals("Male") && !gender.equals("Female")) {
        		message += "Please select a valid gender (Male or Female)<br>";
        		valid = false;
        	}
	        String birthdate = request.getParameter("birthdate");
	        	String strDateRegEx =  "\\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|[3][01])";
	        if (!birthdate.matches(strDateRegEx)){
	        	message += "Please select a valid date (Format YYYY-MM-DD)<br>";
        		valid = false;        		
	        }
	        String work_address = request.getParameter("work_address");
	        if (work_address.length()>255) {
	        	message += "Work Address characters exceed limit (255)<br>";
        		valid = false;
		    }
	        String home_address = request.getParameter("home_address");
	        if (home_address.length()>255) {
	        	message += "Home Address characters exceed limit (255)";
        		valid = false;
        	}

	        if (valid==false) {
	        	request.setAttribute("message", message);
	        	request.getRequestDispatcher("/index.jsp").forward(request, response);
		        return;
	        }
		 	
	        User user = new User();
	        user.setName(name);
	        user.setSurname(surname);
	        user.setGender(gender);
	        user.setBirthdate(birthdate);
	        user.setWork_address(work_address);
	        user.setHome_address(home_address);
	       
	        userDao.saveUser(user);
	        response.sendRedirect("display");
			/*
			 * List<User> userlist = userDao.getList();
			 * 
			 * 
			 * request.setAttribute("userlist", userlist); RequestDispatcher dispatcher =
			 * request.getRequestDispatcher("display2.jsp"); dispatcher.forward(request,
			 * response);
			 */
	 }
}

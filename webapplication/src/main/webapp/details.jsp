<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 


<!DOCTYPE html>
<html>
<head>
<title>Details</title>
<style><%@include file="WEB-INF/css/style.css"%></style>
</head>
<body>
	<header>
			<div class="menu">
				<ul>
				  <li><a href="/webapplication/homepage.jsp">Homepage</a></li>
				  <li><a href="/webapplication/index.jsp">Register Users</a></li>
				  <li><a href="/webapplication/display">Display Users</a></li>
				</ul>
			</div>
	</header>
	
<div align="center">
	    <table class="display-table" border="1">
	            <caption><h2>Details</h2></caption>
	            <thead>
		            <tr>
			               <th>Name</th>
			               <th>Surname</th>
			               <th>Gender</th>
			               <th>Birthdate</th>
			               <th>Work Address</th>
			               <th>Home Address</th>
		            </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td><c:out value="${user.name}" /></td>
	                    <td><c:out value="${user.surname}" /></td>
	                    <td><c:out value="${user.gender}" /></td>
	                    <td><c:out value="${user.birthdate}" /></td>
	                    <td><c:out value="${user.work_address}" /></td>
	                    <td><c:out value="${user.home_address}" /></td>
	                </tr>
	            </tbody>
	        </table>
</div>
</body>
</html>
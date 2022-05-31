<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 

<% String user_id = request.getParameter("id") ; 
System.out.println(user_id);
%>
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
				  <li><a href="/webapplication/display.jsp">Display Users</a></li>
				</ul>
			</div>
	</header>
	<sql:setDataSource
        var="web_app"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/web_app"
        user="root" password="Root1234"
    />
    
	<sql:query var="listUsers"   dataSource="${web_app}">
        SELECT users.*, addresses.* FROM users INNER JOIN addresses ON users.id = addresses.id WHERE users.id = ?
        <sql:param value = '<%= request.getParameter("id") %>' />
    </sql:query>
    
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
	            <c:forEach var="user" items="${listUsers.rows}">
	                <tr>
	                    <td><c:out value="${user.user_name}" /></td>
	                    <td><c:out value="${user.user_surname}" /></td>
	                    <td><c:out value="${user.user_gender}" /></td>
	                    <td><c:out value="${user.user_birthdate}" /></td>
	                    <td><c:out value="${user.user_workAddress}" /></td>
	                    <td><c:out value="${user.user_homeAddress}" /></td>
	                </tr>
	            </c:forEach>
	            </tbody>
	        </table>
</div>
</body>
</html>
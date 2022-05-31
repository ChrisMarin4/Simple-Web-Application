<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 


<!DOCTYPE html>
<html>
<head>
<title>Display Users</title>
<style><%@include file="WEB-INF/css/style.css"%></style>
</head>
<body>
	<header>
		<div class="menu">
			<ul>
			  <li><a href="/webapplication/homepage.jsp">Homepage</a></li>
			  <li><a href="/webapplication/index.jsp">Register Users</a></li>
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
        SELECT * FROM users;
    </sql:query>
<div align="center">
        <table class="display-table" border="1">
            <caption><h2>List of users</h2></caption>
            <thead>
	            <tr>
		               <th>Name</th>
		               <th>Surname</th>
	            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${listUsers.rows}">
                <tr onclick="window.location='./details.jsp?id=${user.id}'">
                    <td><c:out value="${user.user_name}" /></td>
                    <td><c:out value="${user.user_surname}" /></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
</div>
</body>
</html>
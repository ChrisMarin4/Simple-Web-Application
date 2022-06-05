<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html>
<head>
<title>Register New User</title>
<style><%@include file="WEB-INF/css/style.css"%></style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
</head>

<script>
  $( function() {
	    $( "#datepicker" ).datepicker({
	      dateFormat: "yy-mm-dd",
	      changeMonth: true,
	      changeYear: true,
	      yearRange: "-100:+0"
	    });
	  } );
 </script>	 
 
 <script type="text/javascript">
 function validateform(){  
	 var name = "document.myform.name.value"; 
	 var surname = "document.myform.surname.value";
	 var regName = /^(?=.{2,30}$)[a-z]+(?:['_.\s][a-z]+)*$/i;
	 console.log(regName.test(name));
	if (regName.match(name)){
	 	 document.getElementById("numloc").innerHTML="Please insert a valid name (Only Characters Allowed, between 2-30 characters)";  
		 return false;	}
    else if (regName.match(surname)){
	 	document.getElementById("numloc2").innerHTML="Please insert a valid surname (Only Characters Allowed, between 2-30 characters)";  
		 return false;	}
	}
	
 </script>
	 
	<body>
		<header>
			<div class="menu">
				<ul>
				  <li><a href="/webapplication/homepage.jsp">Homepage</a></li>
				  <li><a href="/webapplication/display">Display Users</a></li>
				</ul>
			</div>
		</header>
		<h1>Form</h1>
		
		<div class=table>
			<div class=border>
				<p class="error">${message}</p>
				<form name="myform" action="<%=request.getContextPath()%>/register" method="post" onsubmit="return validateform()">
					 <label for="name"><b>Name*</b></label><span id="numloc"></span>
				 		 <input type="text" placeholder="Enter your name" name="name" id="name" required oninvalid="this.setCustomValidity('Please Enter Your Name')" oninput="setCustomValidity('') ">
	    			 <label for="surname"><b>Surname*</b></label><span id="numloc2"></span>
	   					 <input type="text" placeholder="Enter your surname" name="surname" id="surname" required oninvalid="this.setCustomValidity('Please Enter Your Surname')" oninput="setCustomValidity('')">
	   				 <label for="gender"><b>Gender*</b></label>
	   				 		<br>
	    					 <select name="gender" id="gender" required oninvalid="this.setCustomValidity('Please Enter Your Gender')" oninput="setCustomValidity('')">
			                      <option></option>
			                      <option value="Male">Male</option>
			    				  <option value="Female">Female</option>
		    				 </select>
		    				 <br>
	 				 <label for="Birthdate"><b>Birthdate*</b></label>
				 		 <input type="text" onkeypress="return false;" name="birthdate" id="datepicker" oninvalid="this.setCustomValidity('Please Enter Your Birthdate')" oninput="setCustomValidity('')" required>
		 		 	 <label for="Work Address"><b>Work Address</b></label>
				 		 <textarea placeholder="Enter your work address" name="work_address" id="work_address" rows="4" cols="50"> </textarea>
		 		 	 <label for="Home Address"><b>Home Address</b></label>
				 		 <textarea placeholder="Enter your home address" name="home_address" id="home_address" rows="4" cols="50"> </textarea>		  
					<input type="submit" class="submit" value="Submit">
				</form>
			</div>
		</div>
	</body>
</html>

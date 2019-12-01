<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="sn.Session" %>
<%	
	String err="",msg="";
	if(request.getAttribute("err")!=null) err=(String)request.getAttribute("err");
	if(request.getAttribute("msg")!=null) msg=(String)request.getAttribute("msg");
	
	HttpSession sess=request.getSession(false);  
	Session s = new Session();
	boolean isSess=s.getSessionStatus("EDITPROFILE JSP",sess);
	
	if(!isSess){  
		request.setAttribute("err", "Please login first.");
 		request.setAttribute("msg", "");
      	request.getRequestDispatcher("login.jsp").forward(request, response); 
      	return;
    }  
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edit Profile</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,500,700|Raleway:300,500,700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="style.css">
	<script src="script.js?2"></script>
</head>
<body>
	<header id="header"></header>
	<nav id="nav"></nav>
	
	<main class="main">
		
		<section class="textbox row">
			
			<div class="col-xl-3"></div>
			<div class="col-xl-6">
				<h2 class="center">ENTER THE INFORMATION TO CHANGE</h2>
				<div class="border mar-bottom-1"style="padding:20px;">
					<form onsubmit="return validateEditProfile()"action="EditProfileServlet" method="post">
		                
		                <input type="email" 
		                id="email" 
		                name="email" 
		                placeholder="EMAIL" 
		                class="text-nav border mar-bottom-1" >
		                <p id="label1" class="text-red edges"></p>
		              
		                <input type="password" 
		                id="pass" 
		                name="pass" 
		                placeholder="PASSWORD"
		                class="text-nav border mar-bottom-1">
		                <p id="label2" class="text-red edges"></p>
		           	
		           	   	<input type="text" 
		                id="fname" 
		                name="fname" 
		                placeholder="FIRST NAME" 
		                class="text-nav border mar-bottom-1">
		                <p id="label3" class="text-red edges"></p>
		               
		                <input type="text" 
		                id="lname" 
		                name="lname" 
		                placeholder="LAST NAME" 
		                class="text-nav border mar-bottom-1">
		                <p id="label4" class="text-red edges"></p>
		              
		                <input type="text" 
		                id="address" 
		                name="address" 
		                placeholder="ADDRESS"
		                class="text-nav border mar-bottom-1" >
		                <p id="label5" class="text-red edges"></p>
						
						<input type="text" 
						id="city" 
						name="city" 
						placeholder="CITY"
						class="text-nav border mar-bottom-1" >
						<p id="label6" class="text-red edges"></p>
						
						<input type="text" 
						id="state" 
						name="state" 
						placeholder="STATE"
						class="text-nav border mar-bottom-1">
						<p id="label7" class="text-red edges"></p>

		                <input type="text" 
		                id="zip" 
		                name="zip" 
		                placeholder="ZIP CODE"
		                class="text-nav border mar-bottom-1" >
		                <p id="label8" class="text-red edges"></p>

		                <p class="center edges" style="margin:20px 0 25px;">Enter your current credentials below to submit changes</p>
						
						<div class="border"style="padding:20px;">	
							<input type="email" 
							id="email-current" 
							name="email-current" 
							placeholder="CURRENT EMAIL" 
							class="text-nav border">
							<p id="label9" class="text-red edges"></p>
							
							<input type="password" 
							id="pass-current" 
							name="pass-current" 
							placeholder="CURRENT PASSWORD"
							class="text-nav border" >
							<p id="label10" class="text-red edges"></p>
							
							<input type="submit" 
							id="update-button" 
							value="UPDATE INFORMATION" 
							class="text-nav border">
						</div>
						
		            </form>  
				</div>				
	        </div>
			<div class="col-xl-3"></div>
		</section>
	</main>
	<footer class="background-red" id="footer"></footer>
	
	<script>
		createHeader("EDIT PROFILE","<%=err%>","<%=msg%>","");
		createNav(<%=isSess%>);
		createFooter();
	</script>
</body>
</html>
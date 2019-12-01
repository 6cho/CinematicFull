<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="sn.Session" %>
<%	
	String err="",msg="";
	if(request.getAttribute("err")!=null) err=(String)request.getAttribute("err");
	if(request.getAttribute("msg")!=null) msg=(String)request.getAttribute("msg");
	
	HttpSession sess=request.getSession(false);  
	Session s = new Session();
	boolean isSess=s.getSessionStatus("REGISTER JSP",sess);

	if(isSess){  // if sess is active then redirect to profile
		request.setAttribute("err", "");
	    request.setAttribute("msg", "Welcome back, "+sess.getAttribute("fname")+".");
		request.getRequestDispatcher("profile.jsp").forward(request, response);  
	    return;
	} 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Register</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,500,700|Raleway:300,500,700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="style.css">
	<script src="script.js?1"></script>
</head>

<body>
	<header id="header"></header>
	<nav id="nav"></nav>
   	<main class="main">
				
		<section class="textbox row">
			
			<div class="col-xl-4"></div>
			<div class="col-xl-4">
				<h2 class="center">ENTER YOUR INFORMATION</h2>
				<div class="border mar-bottom-1"style="padding:20px;">
					<form onsubmit="return validateRegister()" action="RegisterServlet" method="post">

		                <input type="email" 
		                id="email" 
		                name="email" 
		                placeholder="EMAIL" 
		                class="text-nav border">
		                
		                <p id="label1" class="text-red edges"></p>

		                <input type="email" 
		                id="email-confirm" 
		                name="email-confirm" 
		                placeholder="CONFIRM EMAIL"
		                class="text-nav border">
		                
		                <p id="label2" class="text-red edges"></p>
		              
		                <input 
		                type="password" 
		                id="pass" 
		                name="pass" 
		                placeholder="PASSWORD"
		                class="text-nav border">
		                
		                <p id="label3" class="text-red edges"></p>
		              
		                <input type="password" 
		                id="pass-confirm" 
		                name="pass-confirm" 
		                placeholder="CONFIRM PASSWORD"
		                class="text-nav border">
		                
		                <p id="label4" class="text-red edges"></p>  
		                
		                <input type="text" 
						id="fname" 
						name="fname" 
						placeholder="FIRST NAME" 
						class="text-nav border">
						
						<p id="label5" class="text-red edges"></p>

		                <input type="text" 
		                id="lname" 
		                name="lname" 
		                placeholder="LAST NAME" 
		                class="text-nav border">
		                
		                <p id="label6" class="text-red edges"></p>
						
		               	<input type="submit" 
		               	id="register-button" 
		               	value="REGISTER" 
		               	class="border">
		                
		            </form>  
				</div>
				<p>If you already have an account, you can <a href="login.jsp" class="border"style="margin:5px;">LOGIN</a> instead</p>
	        </div>
			<div class="col-xl-4"></div>
	
		</section>

	</main>
	<footer class="background-red" id="footer"></footer>
	
	<script>
		createHeader("REGISTER","<%=err%>","<%=msg%>",""); 
		createNav(<%=isSess%>);
		createFooter();
	</script>

</body>
</html>
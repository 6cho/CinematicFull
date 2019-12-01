<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="sn.Session" %>
<%	
	String err="",msg="";
	if(request.getAttribute("err")!=null) err=(String)request.getAttribute("err");
	if(request.getAttribute("msg")!=null) msg=(String)request.getAttribute("msg");
	
	HttpSession sess=request.getSession(false);  
	Session s = new Session();
	boolean isSess=s.getSessionStatus("LOGIN JSP",sess);

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
	<title>Login</title>
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
			<div class="col-xl-4" >
				<h2  class="center">ENTER YOUR INFORMATION</h2>
				<div class="border mar-bottom-1"style="padding:20px;">
		            <form  onsubmit="return validateLogin()" action="LoginServlet" method="post">
		               
		                <input type="email" 
		   				id="email-current" 
		                name="email-current" 
		                placeholder="EMAIL" 
		                class="text-nav border">
		                <p id="label1" class="text-red edges"></p>
			    
		                <input type="password" 
		                id="pass-current" 
		                name="pass-current" 
		                placeholder="PASSWORD" 
		                class="text-nav border">
		                <p id="label2" class="text-red edges"></p>

		                <input type="submit" 
		               	id="login-button" 
		               	value="LOGIN" 
		               	class="border">
		               
	                </form>    		               
				</div>
				<p>
					If you do not have an account, you can 
					<a href="register.jsp" class="border"style="margin:5px;">REGISTER</a>
					today
				</p>	 
	        </div>
			<div class="col-xl-4"></div>
		</section>
    </main>
	<footer class="background-red" id="footer"></footer>
	
	<script>
		createHeader("LOGIN","<%=err%>","<%=msg%>",""); 
		createNav(<%=isSess%>);
		createFooter();
	</script>
</body>
</html>
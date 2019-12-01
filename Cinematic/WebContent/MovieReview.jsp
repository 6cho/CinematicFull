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
	<title>MOVIE REVIEW</title>
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
				<h2  class="center">MOVIE NAME</h2>
				<div class="border mar-bottom-1"style="padding:20px;">
		            <form action="MovieReviewServlet" method="post">
		               
		                <input type="text" 
		   				id="title" 
		                name="title" 
		                placeholder="TITLE" 
		                class="text-nav border">
		                <p id="label7" class="text-red edges"></p>
		                
		                <input type="text" 
		   				id="review" 
		                name="review" 
		                placeholder="ENRTER REVIEW" 
		                class="text-nav border">
		                <p id="label1" class="text-red edges"></p>
			    
		                <input type="radio" 
		                name="rating"
		                value = "1"
		                class="text-nav border" checked> 1 <br>
		                <p id="label2" class="text-red edges"></p>
		                
		               	<input type="radio" 
		                name="rating"
		                value = "2"
		                class="text-nav border"> 2 <br>
		                <p id="label3" class="text-red edges"></p>
		                
		            	<input type="radio" 
		                name="rating"
		                value = "3"
		                class="text-nav border"> 3 <br>
		                <p id="label4" class="text-red edges"></p>
		                
		                <input type="radio" 
		                name="rating"
		                value = "4"
		                class="text-nav border"> 4 <br>
		                <p id="label5" class="text-red edges"></p>
		                
		                <input type="radio" 
		                name="rating"
		                value = "5"
		                class="text-nav border"> 5 <br>
		                <p id="label6" class="text-red edges"></p>

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
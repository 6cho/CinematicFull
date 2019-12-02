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
	<title>Movie Title</title>
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
				<h2  class="center">SELECT SEAT</h2>
				<div class="border mar-bottom-1"style="padding:20px;">
		            <form action="SelectSeatServlet" method="post">
		               
		                <input type="checkbox" 
		   				id="R1S1" 
		                name="seat" 
		                value="R1S1"
		                class="text-nav border"> Row 1 Seat 1
			    
		                <input type="checkbox" 
		                id="R1S2"
		                name="seat"
		                value="R1S2"
		                class="text-nav border">Row 1 Seat 2
		                
		                <input type="checkbox" 
		                id="R1S3"
		                name="seat"
		                value="R1S3"
		                class="text-nav border">Row 1 Seat 3
		                
		                <input type="checkbox" 
		                id="R1S4"
		                name="seat"
		                value="R1S4"
		                class="text-nav border">Row 1 Seat 4 <br>
		                
		                <input type="checkbox" 
		   				id="R2S1" 
		                name="seat" 
		                value="R2S1"
		                class="text-nav border"> Row 2 Seat 1
			    
		                <input type="checkbox" 
		                id="R2S2"
		                name="seat"
		                value="R2S2"
		                class="text-nav border">Row 2 Seat 2
		                
		                <input type="checkbox" 
		                id="R2S3"
		                name="seat"
		                value="R2S2"
		                class="text-nav border">Row 2 Seat 3
		                
		                <input type="checkbox" 
		                id="R2S4"
		                name="seat"
		                value="R2S4"
		                class="text-nav border">Row 2 Seat 4 <br>
		                
		               	<input type="checkbox" 
		   				id="R3S1" 
		                name="seat" 
		                value="R3S1"
		                class="text-nav border"> Row 3 Seat 1
			    
		                <input type="checkbox" 
		                id="R3S2"
		                name="seat"
		                value="R3S2"
		                class="text-nav border">Row 3 Seat 2
		                
		                <input type="checkbox" 
		                id="R3S3"
		                name="seat"
		                value="R3S3"
		                class="text-nav border">Row 3 Seat 3
		                
		                <input type="checkbox" 
		                id="R3S4"
		                name="seat"
		                value="R3S4"
		                class="text-nav border">Row 3 Seat 4 <br>

		                <input type="submit" 
		               	id="login-button" 
		               	value="PAY" 
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
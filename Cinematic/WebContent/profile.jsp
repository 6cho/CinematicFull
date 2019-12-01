<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %>
<%@ page import="sn.Session" %>
<%	
	String err="",msg="";
	if(request.getAttribute("err")!=null) err=(String)request.getAttribute("err");
	if(request.getAttribute("msg")!=null) msg=(String)request.getAttribute("msg");
	
	HttpSession sess=request.getSession(false);  
	Session s = new Session();
	boolean isSess=s.getSessionStatus("PROFILE JSP",sess);
	
	if(!isSess){  
		request.setAttribute("err", "Please login first.");
 		request.setAttribute("msg", "");
      	request.getRequestDispatcher("login.jsp").forward(request, response); 
      	return;
    }  
	
	String [] cols= (String[]) sess.getAttribute("cols");
	String [] vals = (String[]) sess.getAttribute("vals");
	vals[1]="**********";
	String isAdmin=(String)sess.getAttribute("isAdmin"); 
	
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Profile</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,500,700|Raleway:300,500,700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="style.css">
	<script src="script.js?1"></script>
</head>

<body>
	<header id="header"></header>
	<nav id="nav"></nav>
   	<main class="main">
		<section class="textbox row" id="profile">	
			<div class="col-xl-3"></div>
			<div class="col-xl-6">
				<h2 class="center">YOUR ACCOUNT</h2>
				<div class="border row"style="padding:20px;">
					
					<% for (int i=0;i<cols.length;i++){%>
						<div class="col-6">
							<h3><%=cols[i] %></h3>
						</div>
						<div class="col-6">
							<p><%=vals[i] %></p>
						</div>
					<%}%>
					
					<a href="editProfile.jsp" class="border" style="margin-top: 3vh;">EDIT PROFILE</a>
				</div>	 
		  	</div>
			<div class="col-xl-3"></div>	
		</section>
	</main>
	<footer class="background-red" id="footer"></footer>
	
	<script>
		createHeader("PROFILE","<%=err%>","<%=msg%>","");
		createNav(<%=isSess%>);
		createFooter();
	</script>
</body>
</html>
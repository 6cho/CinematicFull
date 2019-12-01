<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="sn.Session" %>
<%	
	String err="",msg="";
	if(request.getAttribute("err")!=null) err=(String)request.getAttribute("err");
	if(request.getAttribute("msg")!=null) msg=(String)request.getAttribute("msg");

	HttpSession sess=request.getSession(false);  
	Session s = new Session();
	boolean isSess=s.getSessionStatus("INDEX JSP",sess);
	
	ArrayList <String> titles =(ArrayList <String>)request.getAttribute("titles" );
	ArrayList <String> posters=(ArrayList <String>)request.getAttribute("posters");
%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Cinematic</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,500,700|Raleway:300,500,700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="style.css">
	<script src="script.js?1"></script>
</head>

<body>
	<header id="header"></header>
	<nav id="nav"></nav>
	<main class="main">
		<section>		
			<div class="textbox">
				<h2 style="padding-bottom:0;">WATCH THE LATEST MOVIES NOW THROUGH CINEMATIC</h2>
			</div>
			<div style="background-color: rgb(35,35,35);">			
				<div class="row edges">
					<div class="col-md-6">
						<p class="text-red" style="text-align:right;padding:5vh 5vw">
							Are you searching for the greatest films that are currently showing?<br>
							Do you want to have the best viewing experience that can be offered?<br>
							Do you just want something to watch?
						</p>
					</div>
					<div class="col-md-6">
						<p style="padding:5vh 5vw;">
							If you said yes to any of these questions, <br>
							then we got what you are looking for. <br>
							Scroll down to view our collection of films.
						</p>
					</div>
				</div>			
			</div>
			<div class="textbox">
				<h2 style="padding-bottom: 0;">FEATURED FILMS</h2>
			</div>
			<div class="row edges">
			
			<% 	for(int i=0;i<4;i++){ %>
				<div class="col-xl-3 col-sm-6">
					<div class="ratio3-4" style="background-image: url(<%= posters.get(i) %>);">
						<div class="overlay title">
							<a href="MovieServlet"class="title">VIEW MOVIE PAGE</a>
						</div>
					</div>	
				</div>
			<% }%>
				
			</div>
			<div class="textbox">
				<h2 style="padding-bottom: 0;">OUR OTHER FILMS</h2>
			</div>
			<div class="row edges">
			
				<% 	for(int i=4;i<10;i++){ %>
					<div class="col-xl-2 col-lg-4 col-sm-6">
						<div class="ratio3-4" style="background-image: url(<%= posters.get(i) %>);">
							<div class="overlay title">
								<a href="MovieServlet"class="title">VIEW MOVIE PAGE</a>
							</div>
						</div>	
					</div>
				<% }%>
			
			</div>
		</section>
		<section>
			<div class="textbox row">
				<div class="col-md-6 edges">
					<h2>LIKE WHAT YOU SEE?</h2>
				</div>
				<div class="col-md-6 edges ">
					<p> 
						<a href="login.jsp"    class="border"style="margin:5px;">LOGIN</a> or 
						<a href="register.jsp" class="border"style="margin:5px;">REGISTER</a>
						to buy tickets today
					</p>	
				</div>
			</div>
		</section>
	</main>
	<footer class="background-red" id="footer"></footer>
	
	<script>
		createHeader("","<%=err%>","<%=msg%>","resources/0.jpg");
		createNav(<%=isSess%>); 
		createFooter();
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Forum Home Page</title>
<link rel="icon" href="/images/logos/logo-laizone1.png" type="image/icon type">
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Comfortaa:700" rel="stylesheet" />
<link href="css/index.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>


<body>
	<div class="loading">
		<div class="spinner"></div>
	</div>

<div class="main">
		<div class="animated slideInDown header" style="animation-delay: 1.8s;">
			<%
		 if (session.getAttribute("loggedIn")==null){
			
			%>
			
			<div class="navbar">
			<a href="login.jsp">login</a> 
			<a href="signup.jsp"style="margin: 0px 2vw;">sign up</a> 
			<a href="index.jsp">home</a>
			</div>
		<%} else { %>
		
			<div class="userNameCorner">Welcome 
			<%=session.getAttribute("first_name")%>, <%=session.getAttribute("last_name")%>
			</div>
			<div class="navbar">
			<a href="userProfile.jsp">my profile</a> 
			<a href="createPost.jsp"style="margin: 0px 2vw;">create post</a> 
			<a href="index.jsp">home</a>	
			</div>
		<%	
		}
		%>
		
			<div class="title">
				<a href="https://laizone.net/"><img
					src="https://laizone.net/images/logos/logo-laizone1.png"
					style="max-height: 30vh; max-width: 40%;"> </a>
			</div>
			<div class="subtitle">
				<p style="color: white;">Login Page</p>
			</div>
			<!-- this is where posts start -->
			<table id="recentPosts" class="viewPosts">
				<tr>
					
				</tr>
			</table>
		</div>
	</div>
</body>
<script src="js/index.js" type="text/javascript"></script>
</html>
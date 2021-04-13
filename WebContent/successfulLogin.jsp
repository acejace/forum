<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>User Profile</title>
<link rel="icon" href="/images/logos/logo-laizone1.png" type="image/icon type">
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Comfortaa:700" rel="stylesheet" />
<link href="css/index.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>


<body>
	<%	if (session.getAttribute("loggedIn") == null) {
			response.sendRedirect("login.jsp");	
		}else{
			session.setAttribute("loginFailed",null);
		}%>
		<div class="loading">
		<div class="spinner"></div>
	</div>

	<div class="main">
		<div class="userNameCorner">Welcome 
			<%=session.getAttribute("first_name")%>, <%=session.getAttribute("last_name")%>
			</div>
			<div class="navbar">
			<a href="userProfile.jsp">my profile</a> 
			<a href="myPosts.jsp"style="margin: 0px 2vw;">my posts</a> 
			<a href="index.jsp">home</a>	
			</div>
			<div class="title">
				<a href="https://laizone.net/"><img
					src="https://laizone.net/images/logos/logo-laizone1.png"
					style="max-height: 30vh; max-width: 40%;"> </a>
			</div>
			<div class="subtitle">
				<p style="color: white;">Login Page</p>
			</div>
			<img class="userImg"
				src='<%=session.getAttribute("img_profile_link")%>'>
			<p>
				Congratulations, <b><%=session.getAttribute("first_name")%>, </b> <b><%=session.getAttribute("last_name")%></b>
				you have successfully logged in <br>
			</p>
		</div>

</body>
<script src="js/index.js" type="text/javascript"></script>
</html>

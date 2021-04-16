<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Logged In</title>
<link rel="icon" href="/images/logos/logo-laizone1.png" type="image/icon type">
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Comfortaa:700" rel="stylesheet" />
<link href="css/index.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<%
session.setAttribute("page", "logged in");
session.setAttribute("subtitle", "Welcome!!");
%>

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
		<div id="cornerNav"> </div>
	<div class="animated slideInDown header" style="animation-delay: 1.8s;" id="loadHeader"></div>
			<img class="userImg"
				src='<%=session.getAttribute("img_profile_link")%>'>
			<h1>
				Congratulations, <b><%=session.getAttribute("first_name")%>, </b> <b><%=session.getAttribute("last_name")%></b>
				you have successfully logged in <br>
			</h1>
	</div>

</body>
<script src="js/index.js" type="text/javascript"></script>
</html>

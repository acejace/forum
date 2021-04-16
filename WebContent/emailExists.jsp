<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Email already exists</title>
</head>
<body>
	<%
	session.setAttribute("page", "home");
	session.setAttribute("subtitle", "sign in failed");
	%>
	<div class="main">
		<div class="animated slideInDown header" style="animation-delay: 1.8s;" id="loadHeader">
		<div id="cornerNav"> </div>
		<div class="animated slideInDown header" style="animation-delay: 1.8s;" id="loadHeader"></div>
	
		<h1>Email already exists</h1>
		<div>
			<a href="login.jsp"> Click here to login</a>
		</div>
		<div>
			<a href="signup.jsp"> Click here to register</a></div>
		</div>
	</div>
</body>
</html>
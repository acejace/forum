<%@ page%>
	<%@ include file="accessJDBC.jsp"%>
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
<%
if (session.getAttribute("is_admin") == null) response.sendRedirect("userProfile.jsp");
else{
session.setAttribute("page", "admin page");
if (session.getAttribute("adminEdit") == "true"){
	
%>
	<h1> Successfully edited/deleted user </h1>
	
	<%
	session.setAttribute("adminEdit", null);	
} 
	session.setAttribute("subtitle", "listing all users");%>
<div class="main">
	<div id="cornerNav"> </div>
	<div class="animated slideInDown header" style="animation-delay: 1.8s;" id="loadHeader"></div>
	<div class="body">
	<input type="text" id="userSearchBar" onkeyup="searchUsers()" placeholder="Search for user id/email/name..">
		<div id="loadUsers">
		
		
		</div>
			
			
	</div>
	</div>
	<%} %>
</body>
<script src="js/index.js" type="text/javascript"></script>
</html>
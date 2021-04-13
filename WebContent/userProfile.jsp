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

		
<% if (session.getAttribute("loggedIn")==null) response.sendRedirect("login.jsp"); %>
	<div class="loading">
		<div class="spinner"></div>
	</div>

<div class="main">

		<div class="animated slideInDown header" style="animation-delay: 1.8s;">
			<div class="navbar">
			
			<div class="userNameCorner">Welcome 
			<%=session.getAttribute("first_name")%>, <%=session.getAttribute("last_name")%>
			</div>
				<a href="userProfile.jsp">my profile</a> 
				<a href="userPosts.jsp"style="margin: 0px 2vw;">my posts</a> 
				<a href="index.jsp">home</a>	
			</div>
			<div class="title">
				<a href="https://laizone.net/"><img
					src="https://laizone.net/images/logos/logo-laizone1.png"
					style="max-height: 30vh; max-width: 40%;"> </a>
			</div>
			<div class="subtitle">
				<p style="color: white;">Your Details</p>
			</div>
		
			<table id="userprofile">
				<tr>
					<th>Profile Picture: </th>
					<td><img class="userImg" src= '<%=session.getAttribute("img_profile_link")%>'> </td>
					<td><a href="google.com"><button value="img_profile_link" class="editBtn">Edit</button></a></td>
				</tr>
			
				<tr>
					<th>First Name: </th> 
					<td><%=session.getAttribute("first_name")%> </td> 
					<td><button value="first_name" class="editBtn">Edit</button></td>
				<tr>
					<th>Last Name: </th> 
					<td><%=session.getAttribute("last_name")%> </td>
					 <td><button value="last_name" class="editBtn">Edit</button>
				</td>
				<tr>
					<th>Email: </th>
					<td><%=session.getAttribute("email")%> </td>
					<td><button value="email" class="editBtn">Edit</button></td>
				</tr>
			</table>
		</div>
	</div>
</body>
<script src="js/index.js" type="text/javascript"></script>
</html>
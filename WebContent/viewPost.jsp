<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="accessJDBC.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>View Post</title>
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
			<div class="userNameCorner"> log in to comment or post
			</div>
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
		
			<!-- this is where posts start -->
			<%	
			
			int post_id = Integer.parseInt(request.getParameter("post_id"));	
			ResultSet rs = app.getPost(post_id);
			rs.next();
			int postUpvotes = rs.getInt("postUpvotes");
			String postName = rs.getString("post_name");
			String content = rs.getString("content");
			%>
			<div class="post">
				<div id="mainPost">
					<h1><%=postName %></h1>
					<div>
						<%=content %>
					</div>
				</div>
				<div id="postComments">
				</div>
				
			</div>
		</div>
	</div>
</body>
<script src="js/index.js" type="text/javascript"></script>
</html>
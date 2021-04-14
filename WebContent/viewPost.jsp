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
<%
session.setAttribute("page", "home");
session.setAttribute("subtitle", "home of the anonymous forum");
%>

<body>
	<div class="loading">
		<div class="spinner"></div>
	</div>

<%
			app.connect();
			int post_id = Integer.parseInt(request.getParameter("post_id"));	
			ResultSet rs = app.getPost(post_id);
			rs.next();
			int postUpvotes = rs.getInt("postUpvotes");
			String postName = rs.getString("post_name");
			String content = rs.getString("content");
			rs = app.getPostComments(post_id);
			app.close();
%>
	<div class="main">
		<div class="animated slideInDown header" style="animation-delay: 1.8s;" id="loadHeader"> </div>
		<div class="post">
			<div id="mainPost">
				<h1 style="text-align: center; ">Title: <%=postName %></h1>
				
				<div>
					<%=content %>
				</div>
			</div>
			<div id="loadComments"> </div>
			
		</div>
		
			
	</div>
</body>
<script src="js/index.js" type="text/javascript"></script>
</html>
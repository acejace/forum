<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
			<div class="subtitle">
				<p style="color: white;">The anonymous forum</p>
			</div>
			<!-- this is where posts start -->
			<div class="buttonHeader">
			<button type="submit" class="btn_one" id="showPostOrder" value="top" onclick="hideTable()">Show Most Recent Posts</button>
			</div>
			<div class="post">
				<h1 style="text-align: left; padding: 0px;"> Displaying the 25 most top posts</h1>
			
			<table class="viewPosts center posts" id="top">
			<tr>
				<th> Author ID </th>
				<th> Upvotes </th>
				<th> Title </th>
				<th> Date Posted </th>
			</tr>
			
			<%
			ResultSet rs = app.getTopPosts(10);
			int userId;
			int postId;
			int postUpvotes;
			String postName;
			String posted_at;
			String postLink;
			
			while (rs.next()){
				userId = rs.getInt("userId");
				postId = rs.getInt("postId");
				postLink = "viewPost.jsp?post_id="+postId;
				postUpvotes = rs.getInt("postUpvotes");
				postName = rs.getString("post_name");
				posted_at = rs.getString("posted_at");
				%>
				<tr>
					<td> <%=userId%></td>
					<td> <%=postUpvotes%> </td>
					<td class="clickable"><a href='<%=postLink%>'> <div><%=postName%></div></a>
					
					</td>
					<td> <%=posted_at%> </td>
				</tr>
				
				<%
			}
			
			%>
			</table>		
			
			<table class="viewPosts center posts hidden" id="recent">
			<tr>
				<th> Author ID </th>
				<th> Upvotes </th>
				<th> Title </th>
				<th> Date Posted </th>
			</tr>
			
			
			<%
			rs = app.getRecentPosts(25);
		
			while (rs.next()){
				userId = rs.getInt("userId");
				postId = rs.getInt("postId");
				postLink = "viewPost.jsp?post_id="+postId;
				postUpvotes = rs.getInt("postUpvotes");
				postName = rs.getString("post_name");
				posted_at = rs.getString("posted_at");
				%>
				<tr>
					<td> <%=userId%></td>
					<td> <%=postUpvotes%> </td>
					<td class="clickable"><a href='<%=postLink%>'> <div><%=postName%></div></a>
					
					</td>
					<td> <%=posted_at%> </td>
				</tr>
				
				<%
			}
			
			%>
			</table>
			</div>
			
			
		</div>
	</div>
</body>
<script src="js/index.js" type="text/javascript"></script>
</html>
<%@ page language="java"%>
<%@ include file="accessJDBC.jsp"%>
<!DOCTYPE JSP>

<html>
<head>
<title>Login</title>
<link rel="icon" href="/images/logos/logo-laizone1.png"	type="image/icon type">
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css"	rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Comfortaa:700"	rel="stylesheet" />
<link href="css/index.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<% if (session.getAttribute("loggedIn")==null) response.sendRedirect("login.jsp"); %>

	<div class="main">
		<div class="loading">
			<div class="spinner"></div>
		</div>
			<% System.out.println(session.getAttribute("email")); %>
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
				<p style="color: white;">Create Post</p>
			</div>
	
			<form class="form" onsubmit="return submitted()" action="validatePost.jsp">
				<div class="inputBox">
					Post Name: <input type="text" name="post_name" id="post_name" value="">
				</div>
				<div class="inputBox">
					Content: <input type="text" name="content" value="">
				</div>
				<div class="inputBox">
					<button type="submit" class="btn_one">Submit</button>
				</div>
			
			</form>
		</div>
	</div>
		

</body>


<script src="js/index.js" type="text/javascript">
</script>
</html>

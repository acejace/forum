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
	<div class="animated slideInDown header" style="animation-delay: 1.8s;">

			<div class="userNameCorner">Welcome 
			<%=session.getAttribute("first_name")%>, <%=session.getAttribute("last_name")%>
			</div>
			<div class="navbar">
			<a href="userProfile.jsp">my profile</a> 
			<a href="createPost.jsp"style="margin: 0px 2vw;">create post</a> 
			<a href="index.jsp">home</a>	
			</div>
			  
			<div class="title">
				<a href="https://laizone.net/"><img
					src="https://laizone.net/images/logos/logo-laizone1.png"
					style="max-height: 30vh; max-width: 40%;"> </a>
			</div>
		<div class="subtitle">
			<p style="color: white;">Editing </p>
		</div>
<% 
boolean changed = false;
String val = request.getParameter("value");
String email = (String) session.getAttribute("email");

if (val=="") {
	%>
	<div class="subtitle">
			<p style="color: white;">Please make sure to fill the required field. </p>
		</div>
	<button class="btn_two" id="backButton"> Click here to go back.</button>
		
		</div>
	<%}
	 else{
		String editType = request.getParameter("edit");
		if (editType=="change profile picture"){
			
	%>	
	<div> Successfully changed</div>
	<%}
	}%>
	
</div>
</body>


<script src="js/index.js" type="text/javascript">
</script>
</html>

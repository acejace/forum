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
	<%
	session.setAttribute("page", "edit");
	session.setAttribute("subtitle", "currently editing");
	%>
<% if (session.getAttribute("loggedIn")==null) response.sendRedirect("login.jsp"); %>
<div class="main">
	<div class="loading">
		<div class="spinner"></div>
	</div>
	<div id="cornerNav"> </div>
	<div class="animated slideInDown header" style="animation-delay: 1.8s;" id="loadHeader"></div>
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

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
		String val = request.getParameter("value");
		String email = (String) session.getAttribute("email");
		String edit = request.getParameter("edit");
		if (val=="") {
		%>
	<div class="subtitle">
			<p style="color: white;">Please make sure to fill the required field. </p>
		</div>
	<button class="btn_two" id="backButton"> Click here to go back.</button>
		
	<%} else{
			app.connect();
			if (edit.equals("changeProfileImg")){

				if (app.updateUserProfile(email, val)){
					session.setAttribute("img_profile_link",  app.getUserImg(email));
					response.sendRedirect("userProfile.jsp");
					app.close();
				}
			}
			if (edit.equals("changeFirstName")){

				if (app.updateUserFirstName(email, val)){
					session.setAttribute("first_name", app.getUserFirstName(email));
					response.sendRedirect("userProfile.jsp");
					app.close();
				} 
			}
			if (edit.equals("changeLastName")){

				if (app.updateUserFirstName(email, val)){
					session.setAttribute("last_name",  app.getUserLastName(email));
					response.sendRedirect("userProfile.jsp");
					app.close();
				} 
			}
			
			if (edit.equals("changeEmail")){
				if (app.updateUserEmail(email, val)){
					response.sendRedirect("logout.jsp");
					app.close();
				} 
			}
			
			if (edit.equals("password")){
				if (app.updateUserPassword(email, val)){
					response.sendRedirect("logout.jsp");
					app.close();
				} 
			}
	%>	
		<div> There was an error changing your profile.</div>
		<div> <button id="backButton"> Click here to go back</button></div>
	<%			
			}
	%>

	<% 
	 app.close();
	%>
	</div>
</body>


<script src="js/index.js" type="text/javascript">
</script>
</html>

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
<% if (session.getAttribute("loggedIn")!=null) response.sendRedirect("userProfile.jsp");
session.setAttribute("page", "login");
session.setAttribute("subtitle", "Login Page!");
String loginErrorMsg = (String) session.getAttribute("loginFailed");
if (loginErrorMsg == null) session.setAttribute("loginFailed","");	%>
<div class="main">
	<div class="loading">
		<div class="spinner"></div>
	</div>
		<div id="cornerNav"></div>
		<div class="animated slideInDown header"
			style="animation-delay: 1.8s;" id="loadHeader"></div>
		<div> 

		<form class="form"
			action="validateLogin.jsp" id="loginForm">
			<div class="inputBox alignTextCenter">
				Email : <input type="email" name="email" id="email" value="">
			</div>
			<div class="inputBox alignTextCenter">
				Password: <input type="password" name="password" value="">
			</div>
			<div class="inputBox alignTextCenter">
				<button type="submit" class="btn_one">Login</button>
				<button type="reset" value="reset" class="btn_two">Reset
					Form</button>
			</div>
		
			<p class="invalidInput"> <%=loginErrorMsg %></p>
		</form>
		</div>
	</div>


</body>


<script src="js/index.js" type="text/javascript">
</script>
</html>

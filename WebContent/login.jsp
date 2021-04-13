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
<div class="main">
	<div class="loading">
		<div class="spinner"></div>
	</div>

	<div class="animated slideInDown header" style="animation-delay: 1.8s;">
		<div class="navbar">
			<a href="login.jsp">login</a> <a href="signup.jsp"
				style="margin: 0px 2vw;">sign up</a> <a href="#contact">contact</a>
		</div>
		<div class="title">
			<a href="https://laizone.net/"><img
				src="https://laizone.net/images/logos/logo-laizone1.png"
				style="max-height: 30vh; max-width: 40%;"> </a>
		</div>
		<div class="subtitle">
			<p style="color: white;">Login Page</p>
		</div>

		<form class="form" onsubmit="return submitted()"
			action="validateLogin.jsp">
			<div class="inputBox">
				Email : <input type="email" name="email" id="email" value="">
			</div>
			<div class="inputBox">
				Password: <input type="text" name="password" value="">
			</div>
			<div class="inputBox">
				<button type="submit" class="btn_one">Login</button>
				<button type="reset" value="reset" class="btn_two">Reset
					Form</button>
			</div>
			<% 
			String loginErrorMsg= (String) session.getAttribute("loginFailed");
			if (loginErrorMsg == null) loginErrorMsg = "";
			%>
			<p class="invalidInput"> <%=loginErrorMsg %></p>
		</form>
		</div>
	</div>

</body>


<script src="js/index.js" type="text/javascript">
</script>
</html>

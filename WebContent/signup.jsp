<%@ page language="java"%>
<%@ include file="accessJDBC.jsp"%>
<!DOCTYPE jsp>

<html>
<head>
<title>Sign Up</title>
<link rel="icon" href="/images/logos/logo-laizone1.png"
	type="image/icon type">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Comfortaa:700"
	rel="stylesheet" />
<link href="css/index.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<%if (session.getAttribute("loggedIn") != null) response.sendRedirect("successfulLogin.jsp"); %>

	<div id="loading">
		<div id="spinner"></div>
	</div>
	<div class="main">
		<div id="cornerNav"></div>
		<div class="animated slideInDown header"
			style="animation-delay: 1.8s;" id="loadHeader"></div>
		<div class="post">
			<form class="form" onsubmit="return submitted()"
				action="validateSignup.jsp">
				<div class="inputBox">
					Email : <input type="email" name="email" id="email" value="">
				</div>
				<div class="inputBox">
					Password: <input type="password" name="password" value="">
				</div>
				<div class="inputBox">
					First Name : <input type="text" name="first_name" value="">
				</div>
				<div class="inputBox">
					Last Name: <input type="text" name="last_name" value="">
				</div>
				<div class="inputBox">
					<button type="submit" class="btn_one">Sign Up</button>
					<button type="reset" value="reset" class="btn_two">Reset
						Form</button>
				</div>

			</form>
			<p class="invalidInput"></p>
		</div>
	</div>
</body>



<script src="js/index.js" type="text/javascript">
</script>

</html>

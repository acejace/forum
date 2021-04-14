<%@ page language="java"%>
<%@ include file="accessJDBC.jsp"%>
<!DOCTYPE JSP>

<html>
<head>
<title>Login</title>
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
	<% if (session.getAttribute("loggedIn")==null) response.sendRedirect("login.jsp"); %>

	<div id="cornerNav"> </div>
	<div class="main">

		<div class="loading">
			<div class="spinner"></div>
		</div>

		<div class="animated slideInDown header"
			style="animation-delay: 1.8s;" id="loadHeader"></div>
			
		<div class="body">
			<div class="post" id="mainPost">
				<form class="form" onsubmit="return submitted()"
					action="validatePost.jsp">
					<div class="inputBox">Post Name:</div>
					<div class="inputBox">
						<input type="text" name="post_name" id="post_name" value=""
							style="left: 0;">
					</div>
					<div class="inputBox">Content:</div>
					<div class="inputBox">

						<textarea name="content" style="width: 80%"></textarea>
					</div>
					<div class="inputBox">
						<button type="submit" class="btn_one">Submit</button>
					</div>

				</form>
			</div>
		</div>

	</div>

</body>


<script src="js/index.js" type="text/javascript">
</script>
</html>

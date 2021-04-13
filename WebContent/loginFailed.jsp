<%@ page language="java"%>
<%@ include file="accessJDBC.jsp" %>
<!DOCTYPE JSP>

<html>
<head>
<title>
Login
</title>
</head>
<body>
	<form class="form" onsubmit="return submitted()" action="validateLogin.jsp">
		Email : <input type="email" name="email" id = "email" value=""> 
		Password: <input type="text" name="password" value=""> 
		 <button type="submit">Login</button>
		 <button type="reset" value="reset" >Reset Form</button>
		 <p class="invalidInput"> No found matching email and password. Please try again or create a new account.</p>
	</form>
</body>
<script src="js/index.js" type="text/javascript">
</script>
</html>

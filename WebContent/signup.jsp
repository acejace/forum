<%@ page language="java"%>
<%@ include file="accessJDBC.jsp" %>
<!DOCTYPE jsp>

<html>
<head>
<title>
test</title>
</head>
<body>
	<form class="form" onsubmit="return submitted()" action="validateSignup.jsp">
		Email : <input type="email" name="email" id = "email" value=""> 
		Password: <input type="text" name="password" value=""> 
		First Name : <input type="text"	name="first_name" value=""> 
		Last Name: <input type="text" name="last_name" value="">		
		
		 <button type="submit">Sign Up</button>
		 <button type="reset" value="reset" >Reset Form</button>
		 
	</form>
	<p class="invalidInput"> </p>
</body>



<script src="js/index.js" type="text/javascript">
</script>

</html>

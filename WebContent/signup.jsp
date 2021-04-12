<%@ page language="java"%>
<%@ include file="accessJDBC.jsp" %>
<!DOCTYPE html>

<html>
<head>
<title>
test</title>
</head>
<body class="signupPage">
	<form id="signup" onsubmit="return submitted()" action="validateSignup.jsp">
		Email : <input type="email" name="email" id = "email" value=""> 
		Password: <input type="text" name="password" value=""> 
		First Name : <input type="text"	name="first_name" value=""> 
		Last Name: <input type="text" name="last_name" value="">		
		
		 <button type="submit">Sign Up</button>
		 <button type="reset" value="reset" >Reset Form</button>
		 <p id="invalid"> </p>
	</form>
</body>


<script>
//document.getElementById("click").addEventListener("click", submitted());
function submitted() {
	var form = document.getElementById("signup");
	var inputs = form.getElementsByTagName("input");
	if (validateInputs(inputs)){
		
		return true;
	}else{
		
		return false;
	}
}
</script>
<script src="js/index.js" type="text/javascript">
</script>
</html>

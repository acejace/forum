<%@ page language="java" %>
<%@ include file="accessJDBC.jsp" %>
<!DOCTYPE html>

<html>
<head>
<title>
test</title>
</head>
<body>

		<%
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();
		String first_name = request.getParameter("first_name").trim();
		String last_name = request.getParameter("last_name").trim();
		
		app.registerUser(email,password,first_name, last_name);
		%>

<script src="js/index.js" type="text/javascript">
</script>
</html>



</body>
<script src="js/index.js" type="text/javascript">
</script>
<% app.close(); %>
</html>

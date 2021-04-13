<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Successful Registration!</title>
</head>
<body>

<% if ((boolean)(session.getAttribute("loggedIn"))){ %>
<p> Congratulations, 
<b><%=session.getAttribute("first_name")%>, </b>
<b><%=session.getAttribute("last_name")%></b>
you have successfully logged in <br>
</p>
<%
} else{
	response.sendRedirect("login.jsp");
}
%>
</body>
</html>
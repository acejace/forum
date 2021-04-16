<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Successful Registration!</title>
</head>
<body>

<img class="userImg" src= '<%=session.getAttribute("img_profile_link")%>'>
<h1> Congratulations, 
<%=session.getAttribute("first_name")%> your account has been successfully created. <br>
Your login is :
<%=session.getAttribute("email") %>
</h1>

</body>
</html>
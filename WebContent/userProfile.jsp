<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>

<meta charset="ISO-8859-1">
<title>User Profile</title>
<link rel="icon" href="/images/logos/logo-laizone1.png" type="image/icon type">
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Comfortaa:700" rel="stylesheet" />
<link href="css/index.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>


<body>
		
	<% if (session.getAttribute("loggedIn")==null) response.sendRedirect("login.jsp"); 
	session.setAttribute("page", "user profile");
	session.setAttribute("subtitle", "user profile");
	%>


	<div class="loading">
		<div class="spinner"></div>
	</div>

<div class="main">
	<div id="cornerNav"> </div>
	<div class="animated slideInDown header" style="animation-delay: 1.8s;" id="loadHeader"></div>
	
	<table id="userprofile">
		<tr>
			<th>Profile Picture: </th>
			<td><img class="userImg" src= '<%=session.getAttribute("img_profile_link")%>'> </td>
			<td> 
				<form action="edit.jsp" class="form">
					 <input type="hidden" name="edit" value="changeProfileImg">
					 <input type="text" id="value" name="value" placeholder="enter img url" class="input">
					 <button type="submit" class="editBtn">Edit</button>
				 </form>
			</td>
		</tr>
	
		<tr>
			<th>First Name: </th> 
			<td><%=session.getAttribute("first_name")%> </td> 
			<td>
				<form action="edit.jsp" class="form">
					 <input type="hidden" name="edit" value="changeFirstName">
					 <input type="text" id="value" name="value" placeholder="enter new first name" class="input">
					 <button type="submit" class="editBtn">Edit</button>
				 </form>
			</td>
		<tr>
			<th>Last Name: </th> 
			<td><%=session.getAttribute("last_name")%> </td>
			 <td>
				<form action="edit.jsp" class="form">
					 <input type="hidden" name="edit" value="changeLastName">
					 <input type="text" id="value" name="value" placeholder="enter new last name" class="input">
					 <button type="submit" class="editBtn">Edit</button>
				 </form>
			</td>
		<tr>
			<th>Email: </th>
			<td><%=session.getAttribute("email")%> </td>
			<td>
				<form action="edit.jsp" class="form">
					 <input type="hidden" name="edit" value="changeEmail">
					 <input type="text" id="value" name="value" placeholder="enter new email name" class="input">
					 <button type="submit" class="editBtn">Edit</button>
				</form>
				<p style="font-size:0.5vw; text-align: left;">Note this will require you to login after the change</p>
			</td>
		</tr>
	</table>
	<div id="footer">
	created by: Jace Lai
	</div>
</div>

</body>
<script src="js/index.js" type="text/javascript"></script>
</html>
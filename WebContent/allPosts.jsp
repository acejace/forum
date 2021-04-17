<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="accessJDBC.jsp"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>All Forum Posts</title>

<link rel="icon" href="/images/logos/logo-laizone1.png" type="image/icon type">
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Comfortaa:700" rel="stylesheet" />
<link href="css/index.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>


<body>
	<div class="loading">
		<div class="spinner"></div>
	</div>
<%
session.setAttribute("page", "all posts");
session.setAttribute("subtitle", "currently viewing all posts");
%>
<div class="main">
	<div id="cornerNav"> </div>
		<div class="animated slideInDown header" style="animation-delay: 1.8s;" id="loadHeader">
		</div>
			<!-- this is where posts start -->
			<div class="buttonHeader">
			<button type="submit" class="btn_one" id="showPostOrder" value="top" >Show Most Recent Posts</button>
			<div>
			<input type="text" id="postSearchBar" onkeyup="searchPost()" placeholder="Search for post names..">
			</div>
			</div>
			
			<div class="post" id="loadPosts">
				
			</div>
			
			
		</div>
</body>

<script src="js/index.js" type="text/javascript"></script>
</html>
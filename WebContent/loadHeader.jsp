
<%
if (session.getAttribute("loggedIn")==null){
%>
<div class="userNameCorner">log in to comment or post</div>
<div class="navbar">
	<a href="login.jsp">login</a> <a href="signup.jsp"
		style="margin: 0px 2vw;">sign up</a> <a href="index.jsp">home</a>
</div>
<%
} else { 
%>

<div class="userNameCorner"><div>
	Welcome
	<%=session.getAttribute("first_name")%>,
	<%=session.getAttribute("last_name")%>
	</div>
	<div>
	<button class="btn_three" id="logOutButton">Log Out</button>
	</div>
</div>
<div class="navbar">
	<%
if (session.getAttribute("page")=="user profile"){
%>

	<%} else{
	%>


	<%}%>
	<a href="userProfile.jsp">my profile</a> <a href="createPost.jsp"
		style="margin: 0px 2vw;">create post</a>
	<%
if (session.getAttribute("page")=="home"){
%>
	<a href="allPosts.jsp">all posts</a>

	<%} else{ %>
	<a href="index.jsp">home</a>
</div>
<%	
}
}
%>

<div class="title">
	<a href="https://laizone.net/"><img
		src="https://laizone.net/images/logos/logo-laizone1.png"
		style="max-height: 30vh; max-width: 40%;"> </a>
</div>
<div id="subtitle">
	<p style="color: white;"><%=session.getAttribute("subtitle") %></p>
</div>

<div class="navbar">
	<%
		if (session.getAttribute("page") == "user profile") {
	%>
	<a href="allPosts.jsp">all posts</a>
	<%
		} else {
	if (session.getAttribute("loggedIn")!=null ) {%>
	<a href="userProfile.jsp">my profile</a>

	<%}
		}
	if (session.getAttribute("loggedIn")!=null ) {
	%>
	<a href="createPost.jsp" style="margin: 0px 2vw;">create post</a>
	<%
	} else{
	%>

<%	}if (session.getAttribute("page") == "home") {
	%>
	<a href="allPosts.jsp">all posts</a>

	<%
		} else {
	%>
	<a href="index.jsp">home</a>
	<%
		}
	%>

	<div class="title">
		<a href="https://laizone.net/"><img
			src="https://laizone.net/images/logos/logo-laizone1.png"
			style="max-height: 30vh; max-width: 40%;"> </a>
	</div>
	<div id="subtitle">
		<p style="color: white;"><%=session.getAttribute("subtitle")%></p>
	</div>
</div>
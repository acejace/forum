
<%
if (session.getAttribute("loggedIn")==null){
%>
<div class="cornerNav"><div>log in to comment or post</div>
<div><button class="btn_two" id="logInButton">Log In</button><button class="btn_three" id="signUpButton">Sign Up</button></div>
</div>
<%
} else { 
%>
<div class="cornerNav"><div>
	Welcome
	<%=session.getAttribute("first_name")%>,
	<%=session.getAttribute("last_name")%>
	</div>
	<div>
	<button class="btn_three" id="logOutButton">Log Out</button>
	</div>
	
	<div id="rightDiv">
	<button id="backButton" class="btn_two">back</button>
	</div>
</div>
<%
}
%>
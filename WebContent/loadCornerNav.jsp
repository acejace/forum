
<%
if (session.getAttribute("loggedIn")==null){
%>
<div class="cornerNav">log in to comment or post</div>
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
</div>
<%
}
%>
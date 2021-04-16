<%@ include file="accessJDBC.jsp"%>
<%
			app.connect();
			int post_id = Integer.parseInt(request.getParameter("post_id"));	
			ResultSet rs = app.listAllUsers();
			
			%>
<% if (!rs.isBeforeFirst()) {    %>

<div class="comment">
	<table class="viewComments ">
		<tr style="border: 2px solid white;">
			<td rowspan=2 style="width: 10%;"> <button class="btn_one showHideCommentButton">Show/Hide Comment </button></td>
			<td colspan=2 style="border: 2px solid white;">No comments yet</td>
		</tr>
		<tr>
			<td></td>
			<td class="alignTextLeft" colspan="2">
		</tr>
	</table>
</div>
<% } else{ %>
<%
			String user_id;
			String comment_date;
			String content;
			int upvotes;
			boolean hasComments = false;
			while (rs.next()){
				user_id = rs.getString("userId");
				comment_date = rs.getString("posted_at");
				content = rs.getString("content");
				upvotes = rs.getInt("postUpvotes");
				hasComments = true;
%>

<div class="comment">
	<table class="viewComments ">
		<tr>
		<td rowspan=2 style="width: 10%;border-right: 2px dotted white;"> <button class="btn_one showHideCommentButton">Hide Comment </button></td>
			<td class="userIdComment">User: <%=user_id %></td>
			<td colspan="2" class="userCommentDate">comment timestamp: <%=comment_date %></td>
		</tr>
		<tr>
			<td style="border-right: 2px dotted white;">Upvotes: <%= upvotes %></td>
			<td class="alignTextLeft" colspan="2"><%= content %>
		</tr>
	</table>
</div>
<%}
	} 
	app.close();%>
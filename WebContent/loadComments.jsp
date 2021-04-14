<%@ include file="accessJDBC.jsp"%>
<%
			app.connect();
			int post_id = Integer.parseInt(request.getParameter("post_id"));	
			ResultSet rs = app.getPostComments(post_id);
			
			%>
<% if (!rs.isBeforeFirst()) {    %>
<div class="comment">
	<table class="viewComments ">
		<tr>
			<td class="userIdComment">No comments yet</td>
			<td colspan="2" class="userCommentDate"></td>
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
				System.out.println("has comments");
				user_id = rs.getString("userId");
				comment_date = rs.getString("posted_at");
				content = rs.getString("content");
				upvotes = rs.getInt("postUpvotes");
				hasComments = true;
%>
<div class="comment">
	<table class="viewComments ">
		<tr>
			<td class="userIdComment">User: 10000</td>
			<td colspan="2" class="userCommentDate">Posted On: 14/1/2222</td>
		</tr>
		<tr>
			<td>Upvotes: <%= upvotes %></td>
			<td class="alignTextLeft" colspan="2"><%= content %>
		</tr>
	</table>
</div>
<%}
	} %>
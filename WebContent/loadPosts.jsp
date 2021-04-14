<%@ include file="accessJDBC.jsp" %>
<h1 style="text-align: left; padding: 0px;" id="displayType">displaying the most upvoted posts first</h1>
<table class="viewPosts center posts" id="top">
			<tr>
				<th> Author ID </th>
				<th> Upvotes </th>
				<th> Title </th>
				<th> Date Posted </th>
			</tr>
			
			<%
			app.connect();
			ResultSet rs = app.getTopPosts();
			int userId;
			int postId;
			int postUpvotes;
			String postName;
			String posted_at;
			String postLink;
			
			while (rs.next()){
				userId = rs.getInt("userId");
				postId = rs.getInt("postId");
				postLink = "viewPost.jsp?post_id="+postId;
				postUpvotes = rs.getInt("postUpvotes");
				postName = rs.getString("post_name");
				posted_at = rs.getString("posted_at");
				%>
				<tr>
					<td> <%=userId%></td>
					<td> <%=postUpvotes%> </td>
					<td class="clickable"><a href='<%=postLink%>'> <div><%=postName%></div></a>
					
					</td>
					<td> <%=posted_at%> </td>
				</tr>
				
				<%
			}
			
			%>
			</table>		
			
			<table class="viewPosts posts hidden" id="recent">
			<tr>
				<th> Author ID </th>
				<th> Upvotes </th>
				<th> Title </th>
				<th> Date Posted </th>
			</tr>
			
			
			<%
			rs = app.getRecentPosts();
		
			while (rs.next()){
				userId = rs.getInt("userId");
				postId = rs.getInt("postId");
				postLink = "viewPost.jsp?post_id="+postId;
				postUpvotes = rs.getInt("postUpvotes");
				postName = rs.getString("post_name");
				posted_at = rs.getString("posted_at");
				%>
				<tr>
					<td> <%=userId%></td>
					<td> <%=postUpvotes%> </td>
					<td class="clickable"><a href='<%=postLink%>'> <div><%=postName%></div></a>
					
					</td>
					<td> <%=posted_at%> </td>
				</tr>
				
				<%
			}
			app.close();
			%>
			</table>
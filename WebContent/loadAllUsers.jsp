<%@ include file="accessJDBC.jsp"%>
<%			if (session.getAttribute("is_admin") == null) response.sendRedirect("userProfile.jsp");


			app.connect();
			ResultSet rs = app.listAllUsers();
			
			%>
<% if (!rs.isBeforeFirst()) {    
	System.out.println("no results");
%>

	
	<table class="viewComments ">
		<tr class ="alignTextCenter" style="border: 2px solid white;">
			<td>No users to show</td>
		</tr>
		<tr>
			<td></td>
			<td class="alignTextLeft" colspan="2">
		</tr>
	</table>

<% } else{ %>


	<table class="viewUsers ">
		<tr>
			<td>
				User Id
			</td>
			<td>
				Email
			</td>
			<td>
				First Name
			</td>
			<td>
				Last Name
			</td>
			<td>
				Administrator
			</td>
			<td>
				Image Profile Link
			</td>
			<td>
				Created At
			</td>
			<td>
				Action:
			</td>
		</tr>
<%
			String user_id;
			String user_email;
			String user_first_name;
			String user_last_name;
			boolean user_is_admin;
			String user_img_profile_link;
			String user_created_at;
			boolean hasComments = false;
			while (rs.next()) {
				user_id = rs.getString("id");
				user_email = rs.getString("email");
				user_first_name = rs.getString("first_name");
				user_last_name = rs.getString("last_name");
				user_is_admin= rs.getBoolean("is_admin");
				user_img_profile_link = rs.getString("img_profile_link");
				user_created_at = rs.getString("created_at");		
%>
		<tr style="border-bottom: 3px solid white;">
			<td class="currTableUser">
				<%= user_id %>
			</td>
			<td class="currTableUser">
				<%= user_email %>
			</td>
			<td class="currTableUser">
				<%= user_first_name %>
			</td>
			<td class="currTableUser">
				<%= user_last_name %>
			</td>
			<td>
				<%= user_is_admin %>
			</td>
			<td style="width=20%;">
				<img src="<%= user_img_profile_link %>" class="userImg">
			</td>
			<td>
				<%= user_created_at %>
			</td>
			<td>
				<form onsubmit="deleteUser.jsp" action="deleteUser.jsp">
					<input type="hidden" name="user_id" value="<%=user_id%>">
					<button type="submit" class="btn_two deleteButton">Delete</button>
				</form>
				<form onsubmit="updateUserAdmin.jsp" action="updateUserAdmin.jsp">
					<input type="hidden" name="user_id" value="<%= user_id %>">
					<input type="hidden" name="is_admin" value='<%= user_is_admin %>' >
					<button type="submit" class="btn_two updateUserAdminButton">Make/Revoke Admin</button>
				</form>
			</td>
		</tr>


<%}%></table><%
			
	} 
app.close();%>
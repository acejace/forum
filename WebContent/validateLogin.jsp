<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>
<%@ include file="accessJDBC.jsp" %>
<%

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		app = (accessJDBC) session.getAttribute("app"); 
		username = username.toLowerCase();
		String retStr = null;

		if(username == null || password == null)
				//return null;
		if((username.length() == 0) || (password.length() == 0))
				//return null;


		try 
		{
			app.connect();		
			// TODO: Check if userId and password match some customer account. If so, set retStr to be the username.
			Statement stmt ; //con.createStatement();
			String sql = "SELECT userid, password FROM customer";
			ResultSet rst = stmt.executeQuery(sql);

			while (rst.next()) {
				String userId = rst.getString(1);
				userId = userId.toLowerCase();
				String pass = rst.getString(2);

				if (username.equals(userId) && password.equals(pass)) {
					retStr = userId;
					break;
				}
			
			}
						
		} 
		catch (SQLException ex) {
			out.println(ex);
		}
		finally
		{
			app.close();
		}	
		
		if(retStr != null)
		{	
			session.removeAttribute("loginMessage");
			session.setAttribute("authenticatedUser",username);
		}
		else
			session.setAttribute("loginMessage","Could not connect to the system using that username/password.");

		//return retStr;
	
%>

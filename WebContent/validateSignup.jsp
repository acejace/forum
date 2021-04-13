<%@ page language="java" %>
<%@ include file="accessJDBC.jsp" %>
<%
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();
		String first_name = request.getParameter("first_name").trim();
		String last_name = request.getParameter("last_name").trim();
		

		
		//if successfully registered then
		if (app.registerUser(email,password,first_name, last_name)){
			session.setAttribute("email", email);
			session.setAttribute("first_name", first_name);
			session.setAttribute("last_name",  last_name);
			session.setAttribute("loggedIn", true);
			response.sendRedirect("successfulRegistration.jsp");
			app.close(); 
		}else{
			app.close(); 
			response.sendRedirect("emailExists.jsp");
		}
%>


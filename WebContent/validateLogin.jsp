<%@ page language="java" %>
<%@ include file="accessJDBC.jsp" %>
<%
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();

		
		//if successfully registered then
		if (app.validateLogin(email,password)){
			session.setAttribute("email", email);
			session.setAttribute("first_name", app.getUserFirstName(email));
			session.setAttribute("last_name",  app.getUserLastName(email));
			session.setAttribute("loggedIn", true);
			response.sendRedirect("successfulLogin.jsp");
			app.close(); 
		}else{
			app.close(); 
			response.sendRedirect("loginFailed.jsp");
		}
%>


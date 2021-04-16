<%@ page language="java" %>
<%@ include file="accessJDBC.jsp" %>
<%
		app.connect();
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();

		//if successfully registered then
		if (app.validateLogin(email,password)){
			session.setAttribute("email", email);
			session.setAttribute("first_name", app.getUserFirstName(email));
			session.setAttribute("last_name",  app.getUserLastName(email));
			session.setAttribute("img_profile_link",  app.getUserImg(email));
			int id = app.getUserId(email);
			if (app.getUserAdmin(id))session.setAttribute("is_admin",  app.getUserAdmin(id));
			session.setAttribute("loggedIn", true);
			session.setAttribute("loginFailed", null);
			response.sendRedirect("successfulLogin.jsp");
		}else{
			app.close(); 
			session.setAttribute("loginFailed","Login failed, please try again");
			response.sendRedirect("login.jsp");	}%>
		}
%>


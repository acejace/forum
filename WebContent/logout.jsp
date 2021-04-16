<%@ page language="java" %>
<%@ include file="accessJDBC.jsp" %>
<%
session.setAttribute("email", null);
session.setAttribute("first_name", null);
session.setAttribute("last_name",  null);
session.setAttribute("img_profile_link", null);
session.setAttribute("loggedIn", null);
session.setAttribute("is_admin",  null);
session.setAttribute("loginFailed", "successfully logged out");
response.sendRedirect("login.jsp");
%>


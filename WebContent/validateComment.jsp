<%@ page language="java" %>
<%@ include file="accessJDBC.jsp" %>
<% if (session.getAttribute("loggedIn")==null) response.sendRedirect("login.jsp"); %>
<%		app.connect();
		String email = (String) session.getAttribute("email");
		String content = request.getParameter("content").trim();
		String post_id = request.getParameter("post_id").trim();
		
		//System.out.println(email);
		System.out.println(content);
		
		//if successfully registered then
		if (app.createPost(email,content,post_id)){
			response.sendRedirect("viewPost.jsp?post_id="+post_id);
		}else{
			app.close(); 
			response.sendRedirect("createPost.jsp");	
			
		}
		app.close(); 
		
%>


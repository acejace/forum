<%@ page language="java" %>
<%@ include file="accessJDBC.jsp" %>
<% if (session.getAttribute("loggedIn")==null) response.sendRedirect("login.jsp"); %>

<%		app.connect();
		String email = (String) session.getAttribute("email");
		String content = request.getParameter("content").trim();
		int parent_id = Integer.parseInt(request.getParameter("post_id"));
		if (content == "") {
			request.setAttribute("comment_failed", true);
			app.close(); 
			response.sendRedirect("createPost.jsp");	
		}
		//System.out.println(email);
		
		//if successfully registered then
		if (app.createComment(email,content,parent_id)){

			response.sendRedirect("viewPost.jsp?post_id="+parent_id);
		}else{
			request.setAttribute("comment_failed", true);
			app.close(); 
			response.sendRedirect("createPost.jsp");	
			
		}
		app.close(); 
		
%>


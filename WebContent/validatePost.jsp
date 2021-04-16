<%@ page language="java" %>
<%@ include file="accessJDBC.jsp" %>
<% if (session.getAttribute("loggedIn")==null) response.sendRedirect("login.jsp"); %>
<%		
		try{
			app.connect();
			String email = (String) session.getAttribute("email");
			String post_name = request.getParameter("post_name").trim();
			String content = request.getParameter("content").trim();
			
			//if successfully registered then
			if (app.createPost(email, post_name, content)){
				
				request.setAttribute("comment_failed", true);
				
				response.sendRedirect("index.jsp");
			}else{
				app.close(); 
				session.setAttribute("post_failed", null);
				response.sendRedirect("createPost.jsp");
			}
		}catch (Exception e){
			app.close(); 
			System.out.println(e);
			session.setAttribute("post_failed", null);
			response.sendRedirect("index.jsp");
		}
	


%>
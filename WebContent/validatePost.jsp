<%@ page language="java" %>
<%@ include file="accessJDBC.jsp" %>
<% if (session.getAttribute("loggedIn")==null) response.sendRedirect("login.jsp"); %>
<%		
		try{
			app.connect();
			String email = (String) session.getAttribute("email");
			String post_id = request.getParameter("post_id").trim();
			String content = request.getParameter("content").trim();
		
		
			//System.out.println(email);
			System.out.println(content);
			
			//if successfully registered then
			if (app.createPost(email, post_id, content)){
				
				request.setAttribute("comment_failed", true);
				response.sendRedirect("viewPost.jsp?post_id="+post_id);
			}else{
				app.close(); 

				response.sendRedirect("viewPost.jsp?post_id="+post_id);
			}
		}catch (Exception e){
			app.close(); 
			response.sendRedirect("index.jsp");
		}
	


%>
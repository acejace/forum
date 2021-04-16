<%@ page language="java" %>
<%@ include file="accessJDBC.jsp" %>
<% if (session.getAttribute("loggedIn")==null) response.sendRedirect("login.jsp"); %>
<%		
		try{
			app.connect();
			int post_id = Integer.parseInt(request.getParameter("post_id"));
			String content = request.getParameter("content").trim();
			
			//if successfully editted
			if (app.editPostContent(post_id, content)){
				response.sendRedirect("viewPost.jsp?post_id="+post_id);
			}else{
				app.close(); 
				response.sendRedirect("viewPost.jsp?post_id="+post_id);
			}
		}catch (Exception e){
			app.close(); 
			System.out.println(e);
			
		}
	


%>
<%@ page language="java" %>
<%@ include file="accessJDBC.jsp" %>
<% if (session.getAttribute("loggedIn")==null) response.sendRedirect("login.jsp"); %>
<%		
		try{
			app.connect();
			int post_id = Integer.parseInt(request.getParameter("post_id"));
			int upvotes = Integer.parseInt(request.getParameter("upvote"));
			upvotes += 1;
			if (app.updatePostUpvote(post_id, upvotes)){
				System.out.println("Upvoted");
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
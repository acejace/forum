<%@ page language="java" %>
<%@ include file="accessJDBC.jsp" %>
<%		
		String email = (String) session.getAttribute("email");
		String post_name = request.getParameter("post_name").trim();
		String content = request.getParameter("content").trim();
		
		
		//System.out.println(email);
		System.out.println(content);
		
		//if successfully registered then
		if (app.createPost(email, post_name, content)){
			response.sendRedirect("index.jsp");
		}else{
			app.close(); 
			response.sendRedirect("createPost.jsp");	}%>
		}
%>


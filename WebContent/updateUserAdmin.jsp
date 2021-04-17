<%@ include file="accessJDBC.jsp"%>
<%
//redirect if not admin

if (session.getAttribute("is_admin") == null){
	response.sendRedirect("userProfile.jsp");	
}else{
	Integer user_id = Integer.parseInt(request.getParameter("user_id"));
	app.connect();
	boolean currAdminStatus = (request.getParameter("is_admin") == "true") ? true : false;
	if (app.updateUserAdmin(user_id, !currAdminStatus)){
		session.setAttribute("adminEdit", "true");
		response.sendRedirect("admin.jsp");
}

app.close();



}
%>
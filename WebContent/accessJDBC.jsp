<%@ 
page import =
"
java.io.File,
java.sql.*,
java.text.ParseException,
java.util.Scanner,
forum.accessJDBC
"
%>

<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	accessJDBC app = new accessJDBC();
	session.setAttribute("app", app);
	app.connect();
	//app.createDatabaseTables("/ddl/tables.ddl");
	
	//app.registerUser("fadmin@laizone.net", "temp", "Admin", "Forum");
	int uid = app.getUserId("acejace@hotmail.com");
	app.updateUserFirstName(uid, "JaCe");
	System.out.println(app.listAllUsers());
	app.close(); //remove close later.
%>

8

<html>
<head><title>Absolute Path</title></head>
<% //System.out.println("Working Directory = " + System.getProperty("user.dir")); %> 
</html>
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
	app.connect();
	System.out.println("created new app");
	session.setAttribute("app", app);
	session.setAttribute("loaded",true);
	
	%>
	
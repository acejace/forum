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
	session.setAttribute("app", app);
	session.setAttribute("loaded",true);
	app.close();
	%>
	
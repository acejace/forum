package forum;
import java.io.File;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Scanner;

public class accessJDBC {
	/**
	 * Connection to database
	 */
	private Connection con;
	private String url,uid,pw;
	
	
	public Connection connect() throws SQLException {
		// TODO: Fill in your connection information
		url = "jdbc:mysql://162.241.244.55/laizonen_forum_website?serverTimezone=UTC";
		uid = "laizonen_jacelai";
		pw = "Obelisk1997!";

		System.out.println("Connecting to database.");
		// Note: Must assign connection to instance variable as well as returning it
		// back to the caller
		con = DriverManager.getConnection(url, uid, pw);
		return con;
	}
	/**
	 * Closes connection to database.
	 */
	public void close() {
		System.out.println("Closing database connection.");
		try {
			if (con != null)
				con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 * Creates the database and initializes the data.
	 * parameter must contain a file with .ddl extension.
	 */
	public void createDatabaseTables(String filePath) {
		String fileName = filePath;
		Scanner scanner = null;

		try {
			// Create statement
			Statement stmt = con.createStatement();

			scanner = new Scanner(new File(fileName));
			// Read commands separated by ;
			scanner.useDelimiter(";");
			while (scanner.hasNext()) {
				String command = scanner.next();
				if (command.trim().equals(""))
					continue;
				// System.out.println(command); // Uncomment if want to see commands executed
				stmt.execute(command);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		if (scanner != null)
			scanner.close();

		System.out.println("Data successfully loaded.");
	}
	
	public static void main(String[] args) throws SQLException, ParseException {
		accessJDBC app = new accessJDBC();
		
		app.connect();
		app.createDatabaseTables("ddl/tables.ddl");
		System.out.println(app.listAllUsers());
		app.close();
	}

	public String listAllUsers() throws SQLException {
		StringBuilder output = new StringBuilder();
		output.append("id, email, first_name, last_name, phone, created_at");
		String query = "SELECT id, email, first_name, last_name, phone, created_at FROM Users";
		// Use a PreparedStatement for this query.
		// TODO: Traverse ResultSet and use StringBuilder.append() to add columns/rows
		// to output string

		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			output.append("\n");
			output.append(rs.getString("id")).append(", ");
			output.append(rs.getString("email")).append(", ");
			output.append(rs.getString("first_name")).append(", ");
			output.append(rs.getString("last_name")).append(", ");
			output.append(rs.getString("phone"));
			output.append(rs.getString("created_at"));

		}
		return output.toString();
	}
}

package forum;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.Scanner;

public class accessJDBC {
	/**
	 * Connection to database
	 */
	private Connection con;
	private String url,uid,pw;
	
	
	public Connection connect() throws SQLException {
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
	 * Creates the database and initializes the data if table does not already exists.
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
				//System.out.println(command); // Uncomment if want to see commands executed
				stmt.execute(command);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		if (scanner != null)
			scanner.close();

		System.out.println("Data successfully loaded.");
	}

	public String listAllUsers() throws SQLException {
		StringBuilder output = new StringBuilder();
		output.append("id, email, first_name, last_name, created_at");
		String query = "SELECT id, email, first_name, last_name, created_at FROM Users";
		// Use a PreparedStatement for this query.
		// Traverse ResultSet and use StringBuilder.append() to add columns/rows
		// to output string

		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			output.append("\n");
			output.append(rs.getString("id")).append(", ");
			output.append(rs.getString("email")).append(", ");
			output.append(rs.getString("first_name")).append(", ");
			output.append(rs.getString("last_name")).append(", ");
			//output.append(rs.getString("created_at"));

		}
		return output.toString();
	}
	
	//returns False if email exists in database, returns True otherwise.
	public boolean checkEmail(String email) throws SQLException{
		String query = String.format("SELECT * FROM Users WHERE email = '%s'", email);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		
		return !rs.next();
		
	}
	
	// returns True if successfully registered user. False otherwise.
	public boolean registerUser(String email, String password, String last_name, String first_name){
		try {
			if (checkEmail(email)) {
				String insert = String.format("INSERT INTO Users(email,password,last_name,first_name) VALUES ('%s','%s','%s','%s')", email,password,last_name,first_name);
				PreparedStatement stmt = con.prepareStatement(insert);
				stmt.execute();
				System.out.println("Account created successfully");
				return true;
			}
			System.out.println("Email already exists");
			return false;
		}  catch (SQLException e) {
			System.out.println(e);
			return false;
			
		}
	}
	
	// Helper function, Updates user field with new value;
	public boolean updateUser(int id, String field, String newValue) {
		
		try {
			String update = String.format("UPDATE Users SET %s='%s' WHERE id=%s", field, newValue, id);
			PreparedStatement stmt = con.prepareStatement(update);
			stmt.execute();
			System.out.println("User successfully updated");
			return true;
		} catch (SQLException e) {
			System.out.println(e);
			return false;
		}
	}
	
	// Returns User id from email.
	public int getUserId(String email) throws SQLException {
		String query = String.format("SELECT id FROM Users WHERE email = '%s'", email);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		return rs.getInt("id");
	}
	
	public static void main(String[] args) throws SQLException, ParseException {
		accessJDBC app = new accessJDBC();
		
		app.connect();
		app.createDatabaseTables("ddl/tables.ddl");
		
		
		//app.registerUser("acejace@hotmail.com", "test", "Lai", "FirstName");
		
		//System.out.println(app.listAllUsers());
		app.close();
	}
	
}

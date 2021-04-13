package forum;
import java.io.File;
import java.sql.*;
import java.text.ParseException;
import java.util.Scanner;

public class accessJDBC {
	/**
	 * Connection to database
	 */
	private Connection con;
	private boolean connected = false;
	private String url,uid,pw;
	
	
	public Connection connect() throws SQLException {
		if (connected == false) {
			url = "jdbc:mysql://162.241.244.55/laizonen_forum_website?serverTimezone=UTC";
			
			uid = "laizonen_fadmin";
			pw = "FoRuMlOgInAdMiN360";
	
			System.out.println("Connecting to database.");
			// Note: Must assign connection to instance variable as well as returning it
			// back to the caller
			con = DriverManager.getConnection(url, uid, pw);
			connected = true;
			return con;
		}
		System.out.println("Already connected to database.");
		return con;
	}
	/**
	 * Closes connection to database.
	 */
	public void close() {
		System.out.println("Closing database connection.");
		try {
			if (con != null) {
				con.close();
				connected = false;
			}
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
	
	/**
	 * Displays a string of all user information except for sensitive information such as password.
	 * Format of each user information is as follows
	 * id, email, first_name, last_name, created_at(date)
	 * @return
	 * @throws SQLException
	 */
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
			output.append(rs.getString("id")).append(", \t");
			output.append(rs.getString("email")).append(", \t");
			output.append(rs.getString("first_name")).append(", \t");
			output.append(rs.getString("last_name")).append(", \t");
			output.append(rs.getString("created_at"));

		}
		return output.toString();
	}
	
	
	/***
	 * Checks if email already exists in database.
	 * @param email
	 * @return returns false if email exists in database, returns true otherwise.
	 */
	public boolean checkEmail(String email) {
		try {
			String query = String.format("SELECT * FROM Users WHERE email = '%s'", email.toLowerCase());
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			return !rs.next();
		} catch (SQLException e) {
			System.out.println(e);
			return false;
		}
		
	}
	
	/***
	 * Registers user into the database. 
	 * @param email
	 * @param password
	 * @param last_name
	 * @param first_name
	 * @return returns True if successfully registered user. False otherwise.
	 */
	public boolean registerUser(String email, String password, String last_name, String first_name){
		try {
			if (checkEmail(email)) {
				String insert = String.format("INSERT INTO Users(email,password,last_name,first_name) VALUES ('%s','%s','%s','%s')",
						email.toLowerCase(),
						password,
						last_name.toLowerCase(),
						first_name.toLowerCase());
				PreparedStatement pstmt = con.prepareStatement(insert);
				pstmt.execute();
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
			PreparedStatement pstmt = con.prepareStatement(update);
			pstmt.execute();
			System.out.println("User successfully updated");
			return true;
		} catch (SQLException e) {
			System.out.println(e);
			return false;
		}
	}
	
	/***
	 * Updates the users first name from id.
	 * @param id
	 * @param newFirstName
	 * @return 
	 */
	public boolean updateUserFirstName(int id, String newFirstName) {
		return updateUser(id, "first_name", newFirstName.toLowerCase());
	}
	
	public boolean updateUserLasttName(int id, String newLastName) {
		return updateUser(id, "last_name", newLastName.toLowerCase());
	}
	public boolean updateUserEmail(int id, String newEmail) {
		if (checkEmail(newEmail)) return updateUser(id, "email", newEmail);
		return false;
	}
	public boolean updateUserPassword(int id, String newPassword) {
		return updateUser(id, "password", newPassword);
	}
	
	// Returns User id from email.
	public int getUserId(String email) throws SQLException {
		String query = String.format("SELECT id FROM Users WHERE email = '%s'", email.toLowerCase());
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		return rs.getInt("id");
	}
	
	private String getUserPassword(String email) throws SQLException {
		String query = String.format("SELECT password FROM Users WHERE email = '%s'", email.toLowerCase());
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		return rs.getString("password");
	}
	public String getUserFirstName(String email) throws SQLException {
		
		String query = String.format("SELECT first_name FROM Users WHERE email = '%s'", email.toLowerCase());
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		String temp = rs.getString("first_name");
		String capitlizedFirstLetter = temp.substring(0, 1).toUpperCase() + temp.substring(1);
		return capitlizedFirstLetter;
	}
	public String getUserLastName(String email) throws SQLException {
		String query = String.format("SELECT last_name FROM Users WHERE email = '%s'", email.toLowerCase());
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		String temp = rs.getString("last_name");
		String capitlizedFirstLetter = temp.substring(0, 1).toUpperCase() + temp.substring(1);
		return capitlizedFirstLetter;
	}
	
	
	public boolean validateLogin(String email, String password) throws SQLException {
		String query = String.format("SELECT password FROM Users WHERE email = '%s'", email.toLowerCase());
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		if (rs.getString("password").equals(password)) return true;
		
		return false;
		
		
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

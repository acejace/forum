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
	
	/**
	 * Connects to database.
	 * @return 
	 * @throws SQLException
	 */
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

		//System.out.println("Data successfully loaded.");
	}
	
	/**
	 * Displays a string of all user information except for sensitive information such as password.
	 * Format of each user information is as follows
	 * "id, email, first_name, last_name, created_at, is_admin, img_profile_link
	 * @return
	 * @throws SQLException
	 */
	public String listAllUsers() throws SQLException {
		StringBuilder output = new StringBuilder();
		output.append("id, email, first_name, last_name, created_at, is_admin, img_profile_link");
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
			output.append(rs.getBoolean("is_admin")).append(", \t");
			output.append(rs.getString("img_profile_link")).append(", \t");
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
	 * Registers user into the database. id and date created are automatically initialized.
	 * @param email
	 * @param password
	 * @param last_name
	 * @param first_name
	 * @return returns True if successfully registered user. False otherwise.
	 */
	public boolean registerUser(String email, String password, String last_name, String first_name){
		try {
			if (checkEmail(email)) {
				String imgUrl = "https://laizone.net/images/logos/logo-laizone1.png";
				String insert = String.format("INSERT INTO Users(email,password,last_name,first_name, imgUrl) VALUES ('%s','%s','%s','%s''%s')",
						email.toLowerCase(),
						password,
						last_name.toLowerCase(),
						first_name.toLowerCase(),
						imgUrl);
				PreparedStatement pstmt = con.prepareStatement(insert);
				pstmt.execute();
				//System.out.println("Account created successfully");
				return true;
			}
			//System.out.println("Email already exists");
			return false;
		}  catch (SQLException e) {
			System.out.println(e);
			return false;
			
		}
	}
	/**
	 * Creates a post in the database with user email, post_name and content. 
	 * @param email
	 * @param post_name
	 * @param content
	 * @return
	 */
	public boolean createPost(String email,  String post_name, String content) {
		try {
			int user_id = getUserId(email);
			String insert = String.format("INSERT INTO Posts(userId,post_name,content) VALUES (%s,'%s','%s')",
					user_id,
					post_name,
					content				
					);
			PreparedStatement pstmt = con.prepareStatement(insert);
			pstmt.execute();
			return true;
		}catch (SQLException e) {
			System.out.println(e);
			return false;
		}
	}
	/***
	 * Creates a comment for parent post. 
	 * @param email
	 * @param post_name
	 * @param content
	 * @param parent_id
	 * @return
	 */
	public boolean createComment(String email, String post_name, String content, int parent_id) {
		try {
			int user_id = getUserId(email);
			String insert = String.format("INSERT INTO Posts(userId,post_name,content, parent_id) VALUES (%s,'%s','%s')",
					user_id,
					post_name,
					content				
					);
			PreparedStatement pstmt = con.prepareStatement(insert);
			pstmt.execute();
			return true;
		}catch (SQLException e) {
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
			//System.out.println("User successfully updated");
			return true;
		} catch (SQLException e) {
			System.out.println(e);
			return false;
		}
	}
	
	/***
	 * Updates the users first name from id.Returns true if successful and false if failed. 
	 * @param id
	 * @param newFirstName
	 * @return 
	 */
	public boolean updateUserFirstName(int id, String newFirstName) {
		return updateUser(id, "first_name", newFirstName.toLowerCase());
	}
	
	/***
	 * Updates the users last name from id.Returns true if successful and false if failed. 
	 * @param id
	 * @param newFirstName
	 * @return 
	 */
	public boolean updateUserLasttName(int id, String newLastName) {
		return updateUser(id, "last_name", newLastName.toLowerCase());
	}
	
	/***
	 * Updates the email first name from id. Returns true if successful and false if failed. 
	 * @param id
	 * @param newFirstName
	 * @return 
	 */
	public boolean updateUserEmail(int id, String newEmail) {
		if (checkEmail(newEmail)) return updateUser(id, "email", newEmail);
		return false;
	}
	/***
	 * Updates the password from id. Returns true if successful and false if failed. 
	 * @param id
	 * @param newFirstName
	 * @return 
	 */
	public boolean updateUserPassword(int id, String newPassword) {
		return updateUser(id, "password", newPassword);
	}
	
	/***
	 * Updates the admin status of a user from id. Returns true if successful and false if failed. 
	 * @param id
	 * @param newFirstName
	 * @return 
	 */
	public boolean updateUserAdmin(int id, boolean is_admin) {
		try {
			String update = String.format("UPDATE Users SET is_admin=%s WHERE id=%s", is_admin, id);
			PreparedStatement pstmt = con.prepareStatement(update);
			pstmt.execute();
			//System.out.println("User successfully updated");
			return true;
		} catch (SQLException e) {
			System.out.println(e);
			return false;
		}
	}
	
	
	/***
	 * Gets User's id from email.
	 * @param email
	 * @return
	 * @throws SQLException
	 */
	public int getUserId(String email) throws SQLException {
		String query = String.format("SELECT id FROM Users WHERE email = '%s'", email.toLowerCase());
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		return rs.getInt("id");
	}
	/***
	 * Returns User's First Name from email.
	 * @param email
	 * @return
	 * @throws SQLException
	 */
	
	public String getUserFirstName(String email) throws SQLException {
		
		String query = String.format("SELECT first_name FROM Users WHERE email = '%s'", email.toLowerCase());
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		String temp = rs.getString("first_name");
		String capitlizedFirstLetter = temp.substring(0, 1).toUpperCase() + temp.substring(1);
		return capitlizedFirstLetter;
	}
	
	
	/***
	 * Returns User's Last Name from email.
	 * @param email
	 * @return
	 * @throws SQLException
	 */
	public String getUserLastName(String email) throws SQLException {
		String query = String.format("SELECT last_name FROM Users WHERE email = '%s'", email.toLowerCase());
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		String temp = rs.getString("last_name");
		String capitlizedFirstLetter = temp.substring(0, 1).toUpperCase() + temp.substring(1);
		return capitlizedFirstLetter;
	}
	
	/***
	 * Returns User's Last Name from email.
	 * @param email
	 * @return
	 * @throws SQLException
	 */
	public String getUserImg(String email) throws SQLException {
		
		String query = String.format("SELECT img_profile_link FROM Users WHERE email = '%s'", email.toLowerCase());
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		String temp = rs.getString("img_profile_link");
		return temp;
		
	}
	/***
	 * Returns imgURL from id.
	 * @param email
	 * @return
	 * @throws SQLException
	 */
	public String getUserImg(int id) throws SQLException {
		
		String query = String.format("SELECT img_profile_link FROM Users WHERE id = %d", id);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		String temp = rs.getString("img_profile_link");
		return temp;
	}
	
	/**
	 * Returns a result set of all comments of the parent post.
	 * @param postId
	 * @return
	 */
	public ResultSet getPostComments(int postId) {
		try {
			String query = String.format("SELECT postId,postUpvotes,userId,post_name,posted_at,content FROM Posts WHERE parent_id = %d ORDER BY posted_at DESC", postId);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			return rs;
			
		}catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}
	/***
	 * Returns a certain amount of posts.
	 * @param postId
	 * @param limit
	 * @return
	 */
	public ResultSet getPostComments(int postId, int limit) {
		try {
			String query = String.format("SELECT postId,postUpvotes,userId,post_name,posted_at,content FROM Posts WHERE parent_id = %d ORDER BY posted_at DESC LIMIT %d", postId, limit);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			return rs;
			
		}catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}
	/**
	 * Returns result set of all posts. Comments are not included.
	 * @return
	 */
	public ResultSet getAllPosts() {
		try {
			String query = "SELECT postId,postUpvotes,userId,post_name,posted_at,content FROM Posts WHERE parent_id IS NULL ";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			return rs;
			
		}catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}
	
	/**
	 * Returns result set of all posts ordered by date. Comments are not included.
	 * @return
	 */
	public ResultSet getRecentPosts() {
		try {
			String query = String.format("SELECT postId,postUpvotes,userId,post_name,posted_at,content FROM Posts WHERE parent_id IS NULL ORDER BY posted_at DESC");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			return rs;
			
		}catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}
	/**
	 * Returns result set of all posts ordered by upvotes. Comments are not included.
	 * @return
	 */
	public ResultSet getTopPosts() {
		try {
			String query = "SELECT postId,postUpvotes,userId,post_name,posted_at,content FROM Posts WHERE parent_id IS NULL ORDER BY postUpvotes DESC";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			return rs;
			
		}catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}
	/**
	 * Returns result set of number of recent posts. Comments are not included.
	 * @return
	 */
	public ResultSet getRecentPosts(int limit) {
		try {
			String query = String.format("SELECT postId,postUpvotes,userId,post_name,posted_at,content FROM Posts WHERE parent_id IS NULL ORDER BY posted_at DESC LIMIT %d", limit);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			return rs;
			
		}catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}
	
	/**
	 * Returns result set of number of top posts. Comments are not included.
	 * @return
	 */
	public ResultSet getTopPosts(int limit) {
		try {
			String query = String.format("SELECT postId,postUpvotes,userId,post_name,posted_at,content FROM Posts WHERE parent_id IS NULL ORDER BY postUpvotes DESC LIMIT %d", limit);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			return rs;
			
		}catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	} 
	/**
	 * Returns result set of number of most recent posts. Comments are not included.
	 * @return
	 * @param post_id
	 * @return
	 */
	public ResultSet getPost(int post_id) {
		try {
			String query = String.format("SELECT postId,postUpvotes,userId,post_name,posted_at,content FROM Posts WHERE postId = %d", post_id);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			return rs;
			
		}catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}
	
	/**
	 * Returns result set of number of most recent posts. Comments are not included.
	 * @return
	 * @param post_id
	 * @return
	 */
	public ResultSet getUserPosts(String email) {
		try {
			int user_id = getUserId(email);
			String query = String.format("SELECT postId,postUpvotes,userId,post_name,posted_at,content FROM Posts WHERE user_id = %d", user_id);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			return rs;
			
		}catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}
	
	/***
	 * Returns true if email and password match results in database.
	 * @param email
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	public boolean validateLogin(String email, String password) {
	try {
		String query = String.format("SELECT password FROM Users WHERE email = '%s'", email.toLowerCase());
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		if (rs.getString("password").equals(password)) return true;
		return false;}
	catch (SQLException e) {
		return false;
	}
		
		
	}
	
	public static void main(String args[]) throws SQLException {
		accessJDBC app = new accessJDBC();
		app.connect();
		//if (app.validateLogin("acejace@hotmail.com", "test")) System.out.println("Success");;
		app.close();
		
	}
	
}

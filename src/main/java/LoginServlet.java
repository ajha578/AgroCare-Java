

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
        String password = request.getParameter("password");

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/project"; // Adjust the database name
        String jdbcUsername = "root"; // Default XAMPP username
        String jdbcPassword = ""; // Default XAMPP password

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish database connection
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // SQL query to verify email and password
            String sql = "SELECT * FROM buyers WHERE email = ? AND password = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            resultSet = preparedStatement.executeQuery();

            // Check if a matching user is found
            if (resultSet.next()) {
                out.println("<h3>Login successful! Welcome, " + resultSet.getString("name") + ".</h3>");
                // Redirect to dashboard or next page
                response.sendRedirect("views/dashboard-buyer-fruit.jsp");
            } else {
                out.println("<h3>Invalid email or password. Please try again.</h3>");
            }
        } catch (ClassNotFoundException e) {
            out.println("<h3>Error: Unable to load database driver.</h3>");
            e.printStackTrace(out);
        } catch (SQLException e) {
            out.println("<h3>Error: Database connection or query failed.</h3>");
            e.printStackTrace(out);
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace(out);
            }
        }
    }
}

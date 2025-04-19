import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/LoginServlet") // URL mapping
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/project"; // Adjust the database name
        String jdbcUsername = "root"; // Default XAMPP username
        String jdbcPassword = "aditya3306"; // Default XAMPP password

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
                // Valid login: Create session and redirect to dashboard
                HttpSession session = request.getSession();
                session.setAttribute("userName", resultSet.getString("name"));
                session.setAttribute("userEmail", email);
                response.sendRedirect("views/dashboard-buyer-fruit.jsp");
            } else {
                // Invalid credentials: Set error message and user-entered values
                request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
                request.setAttribute("enteredEmail", email); // Pass user-entered email
                request.getRequestDispatcher("views/login-buyer.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: Unable to load database driver.");
            request.getRequestDispatcher("views/login-buyer.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: Database connection or query failed.");
            request.getRequestDispatcher("views/login-buyer.jsp").forward(request, response);
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

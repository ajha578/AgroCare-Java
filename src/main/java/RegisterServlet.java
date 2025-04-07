import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data from the JSP
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/project";
        String jdbcUsername = "root";
        String jdbcPassword = "";

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a database connection
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // Check if the email already exists
            String checkSql = "SELECT COUNT(*) FROM buyers WHERE email = ?";
            PreparedStatement checkStatement = connection.prepareStatement(checkSql);
            checkStatement.setString(1, email);

            resultSet = checkStatement.executeQuery();
            resultSet.next();
            int count = resultSet.getInt(1);

            if (count > 0) {
                // Email is already registered
                HttpSession session = request.getSession(); // Get the current session
                session.setAttribute("formData", null); // Clear any stored form data in the session
                
                request.setAttribute("errorMessage", "Email is already registered. Please try logging in.");
                request.getRequestDispatcher("views/create-buyer.jsp").forward(request, response);
            } else {
                // Insert the form data into the buyers table
                String sql = "INSERT INTO buyers (name, email, password, gender) VALUES (?, ?, ?, ?)";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, email);
                preparedStatement.setString(3, password);
                preparedStatement.setString(4, gender);

                int rowsInserted = preparedStatement.executeUpdate();

                if (rowsInserted > 0) {
                    // Redirect to login-buyer.jsp
                    response.sendRedirect("views/login-buyer.jsp");
                } else {
                    out.println("<h3>Failed to create account. Please try again.</h3>");
                }
            }
        } catch (ClassNotFoundException e) {
            out.println("<h3>Error: Unable to load database driver.</h3>");
            e.printStackTrace(out);
        } catch (SQLException e) {
            out.println("<h3>Error: Unable to connect to database or execute SQL.</h3>");
            e.printStackTrace(out);
        } finally {
            // Close resources
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(out);
            }
        }
    }
}

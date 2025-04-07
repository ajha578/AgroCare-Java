import java.io.IOException;
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

@WebServlet("/loginfarmer")
public class loginfarmer extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/project";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // SQL query to verify phone and password
            String query = "SELECT * FROM farmers WHERE phone = ? AND password = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, phone);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // Valid login: Create session and redirect to dashboard
                HttpSession session = request.getSession();
                session.setAttribute("user", resultSet.getString("name"));
                response.sendRedirect("views/dashboard.jsp");
            } else {
                // Invalid credentials: Set error message and user-entered values
                request.setAttribute("errorMessage", "Invalid phone number or password!");
                request.setAttribute("enteredPhone", phone); // Pass user-entered phone number
                request.setAttribute("enteredPassword", password); // Pass user-entered password
                request.getRequestDispatcher("views/login-farmer.jsp").forward(request, response);
            }

            // Close resources
            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (ClassNotFoundException e) {
            request.setAttribute("errorMessage", "Error loading database driver: " + e.getMessage());
            request.getRequestDispatcher("views/login-farmer.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("views/login-farmer.jsp").forward(request, response);
        }
    }
}

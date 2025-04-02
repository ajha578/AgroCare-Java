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

@WebServlet("/loginfarmer")
public class loginfarmer extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/project";
    private static final String DB_USER = "root"; // Replace with your database username
    private static final String DB_PASSWORD = ""; // Replace with your database password

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        // Validate user input
        if (phone == null || password == null || phone.isEmpty() || password.isEmpty()) {
            out.println("<h3 style='color:red;'>Phone number and password are required!</h3>");
            return;
        }

        try {
            // Load database driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Check credentials in the database
            String query = "SELECT * FROM farmers WHERE phone = ? AND password = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, phone);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // Create session and redirect to dashboard
                HttpSession session = request.getSession();
                session.setAttribute("user", resultSet.getString("name"));
                response.sendRedirect("views/dashboard.jsp");
            } else {
                // Invalid credentials
                out.println("<h3 style='color:red;'>Invalid phone number or password!</h3>");
            }

            // Close resources
            preparedStatement.close();
            connection.close();
        } catch (ClassNotFoundException e) {
            out.println("<h3 style='color:red;'>Error loading database driver: " + e.getMessage() + "</h3>");
        } catch (SQLException e) {
            out.println("<h3 style='color:red;'>Database error: " + e.getMessage() + "</h3>");
        } finally {
            out.close();
        }
    }
}

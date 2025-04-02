import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Registerfarmer")
public class Registerfarmer extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/project";
    private static final String DB_USER = "root"; // Replace with your database username
    private static final String DB_PASSWORD = ""; // Replace with your database password

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        // Validate user inputs (optional, based on your requirements)
        if (name == null || phone == null || password == null || name.isEmpty() || phone.isEmpty() || password.isEmpty()) {
            out.println("<h3 style='color:red;'>All fields are mandatory!</h3>");
            return;
        }

        // Database insertion logic
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String query = "INSERT INTO farmers (name, phone, password) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, phone);
            preparedStatement.setString(3, password);

            int result = preparedStatement.executeUpdate();
            if (result > 0) {
                out.println("<h3 style='color:green;'>Account created successfully!</h3>");
                response.sendRedirect("views/login-farmer.jsp"); // Redirect to login page
            } else {
                out.println("<h3 style='color:red;'>Failed to create account. Please try again.</h3>");
            }

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

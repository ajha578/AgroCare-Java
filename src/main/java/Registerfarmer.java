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

@WebServlet("/Registerfarmer")
public class Registerfarmer extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/project?useSSL=false&serverTimezone=UTC";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        if (name == null || phone == null || password == null || name.isEmpty() || phone.isEmpty() || password.isEmpty()) {
            request.setAttribute("errorMessage", "All fields are mandatory!");
            request.getRequestDispatcher("views/create-farmer.jsp").forward(request, response);
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load the MySQL JDBC driver

            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String checkQuery = "SELECT COUNT(*) FROM farmers WHERE phone = ?";
                PreparedStatement checkStmt = connection.prepareStatement(checkQuery);
                checkStmt.setString(1, phone);
                ResultSet resultSet = checkStmt.executeQuery();
                resultSet.next();
                if (resultSet.getInt(1) > 0) {
                    request.setAttribute("errorMessage", "Phone number already registered. Please try login.");
                    request.getRequestDispatcher("views/create-farmer.jsp").forward(request, response);
                    return;
                }

                String insertQuery = "INSERT INTO farmers (name, phone, password) VALUES (?, ?, ?)";
                PreparedStatement insertStmt = connection.prepareStatement(insertQuery);
                insertStmt.setString(1, name);
                insertStmt.setString(2, phone);
                insertStmt.setString(3, password);
                int result = insertStmt.executeUpdate();

                if (result > 0) {
                    response.sendRedirect("views/login-farmer.jsp");
                } else {
                    request.setAttribute("errorMessage", "Failed to create account. Please try again.");
                    request.getRequestDispatcher("views/create-farmer.jsp").forward(request, response);
                }
            }

        } catch (ClassNotFoundException e) {
            out.println("<h3 style='color:red;'>Error loading database driver: " + e.getMessage() + "</h3>");
        } catch (SQLException e) {
            out.println("<h3 style='color:red;'>Database error: " + e.getMessage() + "</h3>");
        } finally {
            out.close();
        }
    }
}

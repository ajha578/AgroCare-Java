import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminLoginServlet") // URL mapping for this servlet
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Static admin credentials
    private static final String ADMIN_EMAIL = "admin@agricare.com";  // Replace with your email
    private static final String ADMIN_PASSWORD = "secureAdminPass"; // Replace with your password

    // Handles POST requests for login
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve email and password from the login form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Check static credentials
        if (ADMIN_EMAIL.equals(email) && ADMIN_PASSWORD.equals(password)) {
            // Successful login, redirect to the admin dashboard
            response.sendRedirect(request.getContextPath() + "/admin/admin-dashboard.jsp"); // Adjust path if needed
        } else {
            // Failed login, send error message back to the login page
            request.setAttribute("errorMessage", "Invalid email or password!");
            request.getRequestDispatcher("admin/admin-login.jsp").forward(request, response);
        }
    }
}

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/FarmerToSell")  // Corrected URL mapping
@MultipartConfig
public class FarmerToSell extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        Part filePart = request.getPart("image");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        double price = Double.parseDouble(priceStr);
        String productName = request.getParameter("productName"); // Get the product name
        String category = request.getParameter("category"); // Get the category (fruits, vegetables, cereals)

        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        InputStream fileContent = filePart.getInputStream();

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "aditya3306");

            // Prepare SQL statement to insert product data
            String sql = "INSERT INTO farmer_products (image, image_name, description, price, product_name, category) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setBlob(1, fileContent);
            stmt.setString(2, fileName);
            stmt.setString(3, description);
            stmt.setDouble(4, price);
            stmt.setString(5, productName);  // Bind the product name
            stmt.setString(6, category);     // Bind the category

            // Execute the update
            int rows = stmt.executeUpdate();

            // Check if the insert was successful
            if (rows > 0) {
                response.sendRedirect("views/dashboard.jsp"); // Redirect to dashboard after success
            } else {
                response.getWriter().println("Failed to upload product.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            // Close resources
            try { if (stmt != null) stmt.close(); } catch (Exception ignored) {}
            try { if (conn != null) conn.close(); } catch (Exception ignored) {}
        }
    }
}

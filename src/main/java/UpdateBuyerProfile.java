import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/UpdateBuyerProfile")
@MultipartConfig
public class UpdateBuyerProfile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int buyerId = 1; // In real app, get this from session

        String profileName = request.getParameter("profileName");
        String status = request.getParameter("status");
        String aboutMe = request.getParameter("aboutMe");

        Part filePart = request.getPart("profilePic");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Define upload directory
        String uploadDir = getServletContext().getRealPath("/") + "profile_images";
        File uploadFolder = new File(uploadDir);

        // ✅ Ensure the directory exists
        if (!uploadFolder.exists()) {
            uploadFolder.mkdirs(); // creates the directory if it doesn't exist
        }

        // Save uploaded file
        if (fileName != null && !fileName.isEmpty()) {
            InputStream fileContent = filePart.getInputStream();
            Path filePath = Paths.get(uploadDir, fileName);
            Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);
        }

        // Update database logic here
        // Save relative path: "profile_images/" + fileName
        String imagePath = "profile_images/" + fileName;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "aditya3306");

            PreparedStatement ps = con.prepareStatement("UPDATE buyer_profile SET profile_name=?, status=?, about_me=?, profile_pic=? WHERE buyer_id=?");
            ps.setString(1, profileName);
            ps.setString(2, status);
            ps.setString(3, aboutMe);
            ps.setString(4, imagePath);
            ps.setInt(5, buyerId);

            ps.executeUpdate();
            ps.close();
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("buyer/buyer-setting.jsp");
    }
}

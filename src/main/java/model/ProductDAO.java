package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
	public static List<Product> getProductsByCategory(String category) {
	    List<Product> products = new ArrayList<>();
	    try (Connection conn = DBConnection.getConnection()) {
	        String sql = "SELECT * FROM farmer_products WHERE LOWER(category) = LOWER(?)";
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        stmt.setString(1, category);

	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            Product p = new Product();
	            p.setId(rs.getInt("id"));
	            p.setName(rs.getString("product_name"));
	            p.setDescription(rs.getString("description"));
	            p.setPrice(rs.getInt("price"));
	            p.setImagePath("uploaded_images/" + rs.getString("image_name")); // maps image name to real path
	            p.setCategory(rs.getString("category"));
	            products.add(p);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return products;
	}
	
	// New method to fetch all products across all categories
    public static List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            // SQL query to fetch all products, no category filter
            String sql = "SELECT * FROM farmer_products";
            PreparedStatement stmt = conn.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getInt("price"));
                p.setImagePath("uploaded_images/" + rs.getString("image_name")); // maps image name to real path
                p.setCategory(rs.getString("category"));
                products.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

}

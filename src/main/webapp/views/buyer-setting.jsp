<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    String profileName = "", status = "", aboutMe = "", profilePic = "../image/profile-icon.png";
    int buyerId = 1; // Replace this with session logic in production

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "aditya3306");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM buyer_profile WHERE buyer_id = ?");
        ps.setInt(1, buyerId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            profileName = rs.getString("profile_name");
            status = rs.getString("status");
            aboutMe = rs.getString("about_me");
            profilePic = rs.getString("profile_pic") != null ? rs.getString("profile_pic") : profilePic;
        }
        rs.close();
        ps.close();
        con.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AgriCare Settings</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            min-height: 100vh;
            background-color: #f0f0d8;
        }
        .sidebar {
            width: 200px;
            background-color: #f0f0d8;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            border-radius: 30px 30px 0 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
        }
        .sidebar img {
            max-width: 120px;
            margin-bottom: 10px;
        }
        .sidebar h2 {
            font-size: 18px;
            margin-bottom: 40px;
            text-align: center;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
            width: 100%;
            margin-top: 20px;
        }
        .sidebar ul li {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: transform 0.3s ease-in-out;
        }
        .sidebar ul li:hover {
            transform: scale(1.05);
        }
        .sidebar ul li img {
            margin-right: 10px;
            width: 25px;
            height: 25px;
        }
        .sidebar ul li a {
            text-decoration: none;
            color: #333;
            font-size: 18px;
        }
        .sidebar ul li a[href="#Setting"] {
            color: #ff9900;
        }
        .main-content {
            flex-grow: 1;
            padding: 20px;
        }
        .header h1 {
            font-size: 50px;
            color: #ff9900;
            margin-bottom: 30px;
        }
        .profile-picture {
            margin-bottom: 30px;
        }
        .profile-picture img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            cursor: pointer;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group textarea {
            resize: vertical;
        }
        .save-btn {
            background-color: #28a745;
            color: #fff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 10px;
        }
        .logout-btn {
            background-color: #dc3545;
            color: #fff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 10px;
            margin-left: 20px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <img src="../image/dash-logo.png" alt="Logo">
        <h2>AgriCare</h2>
        <ul>
            <li><img src="../image/dashboard-logo.png" alt="Dashboard Icon"><a href="dashboard-buyer-fruit.jsp">Dashboard</a></li>
            <li><img src="../image/setting-logo.png" alt="Setting Icon"><a href="#Setting">Setting</a></li>
            <li><img src="../image/History-icon.png" alt="History Icon"><a href="buyer-history.jsp">History</a></li>
        </ul>
    </div>
    <div class="main-content">
        <div class="header">
            <h1>Agriculture & Farmers Market</h1>
        </div>

        <form action="../UpdateBuyerProfile" method="post" enctype="multipart/form-data">
            <div class="profile-picture">
                <h3>Profile Picture</h3>
                <label for="fileInput">
                    <img src="<%= profilePic %>" alt="Profile Picture" id="profile-preview">
                </label>
                <input type="file" id="fileInput" name="profilePic" style="display: none;" onchange="previewImage(event)">
            </div>

            <div class="form-group">
                <label for="profile-name">Profile name</label>
                <input type="text" id="profile-name" name="profileName" value="<%= profileName %>">
            </div>
            <div class="form-group">
                <label for="status">Status</label>
                <input type="text" id="status" name="status" value="<%= status %>">
            </div>
            <div class="form-group">
                <label for="about-me">About me</label>
                <textarea id="about-me" name="aboutMe" rows="4"><%= aboutMe %></textarea>
            </div>

            <button type="submit" class="save-btn">Save changes</button>
            <button class="logout-btn"><a href="create-farmer.jsp" style="color: white; text-decoration: none;">Logout</a></button>
        </form>
    </div>

    <script>
        function previewImage(event) {
            const reader = new FileReader();
            reader.onload = function () {
                document.getElementById('profile-preview').src = reader.result;
            }
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>
</body>
</html>

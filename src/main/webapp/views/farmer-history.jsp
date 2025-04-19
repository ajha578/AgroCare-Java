<%@ page import="model.Product, model.ProductDAO, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AgriCare Farmer History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
            background-color: #f0f0d8;
        }
        .sidebar {
            width: 200px;
            background-color: #f0f0d8;
            padding: 20px;
            height: 100vh;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
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
        }
        .sidebar ul li {
            margin-bottom: 20px;
            text-align: center;
        }
        .sidebar ul li img {
            width: 25px;
            vertical-align: middle;
            margin-right: 10px;
        }
        .sidebar ul li a {
            text-decoration: none;
            color: #333;
            font-size: 18px;
        }
        .sidebar ul li a[href="#History"] {
            color: #ff9900;
        }

        .main-content {
            flex-grow: 1;
            padding: 30px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header h1 {
            font-size: 40px;
            color: #ff9900;
        }
        .profile {
            display: flex;
            align-items: center;
        }
        .profile img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }
        .profile span {
            font-size: 18px;
            color: #333;
        }
        .card-container {
            margin-top: 30px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .card {
            background-color: #ffffff;
            display: flex;
            align-items: center;
            padding: 15px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: scale(1.02);
        }
        .card img {
            width: 130px;
            height: auto;
            margin-right: 20px;
            border-radius: 8px;
        }
        .card-details {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .card-details h2 {
            margin: 0;
            font-size: 22px;
            color: #ff9900;
        }
        .card-details p {
            margin: 5px 0;
            font-size: 16px;
        }
        .status {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <img src="../image/dash-logo.png" alt="Logo">
        <h2>AgriCare</h2>
        <ul>
            <li><img src="../image/dashboard-logo.png"><a href="dashboard.jsp">Dashboard</a></li>
            <li><img src="../image/setting-icon.png"><a href="farmer-setting.jsp">Setting</a></li>
            <li><img src="../image/History-icon.png"><a href="#History">History</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="header">
            <h1>Farmer's Market History</h1>
            <div class="profile">
                <img src="../image/profile-icon.png" alt="Profile">
                <span>Mukesh Kumar</span>
            </div>
        </div>

        <div class="card-container">
            <%
                List<Product> products = ProductDAO.getAllProducts();
                for (Product p : products) {
            %>
            <div class="card">
                <img src="<%= p.getImagePath() %>" alt="<%= p.getName() %>">
                <div class="card-details">
                    <h2><%= p.getName() %></h2>
                    <p>Price: ₹<%= p.getPrice() %></p>
                    <p class="status">Status: Active</p>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</body>
</html>

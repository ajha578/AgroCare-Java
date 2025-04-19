<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AgriCare Dashboard</title>
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
            border-top-right-radius: 30px;
            border-bottom-right-radius: 10px;
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
            justify-content: flex-start;
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
        .main-content {
            flex-grow: 1;
            padding: 20px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
        .header h1 {
            font-size: 50px;
            color: #ff9900;
        }
        .header .profile {
            display: flex;
            align-items: center;
        }
        .header .profile img {
            border-radius: 50%;
            margin-right: 10px;
        }
        .header .profile span {
            font-size: 16px;
            color: #333;
        }
        .card {
            width: 80%;
            background-color: #fff;
            padding: 20px;
            border-radius: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease-in-out;
            margin-bottom: 20px;
            margin-top: 10px;
            position: relative;
            display: flex;
            flex-direction: column;
            margin-left: 20px;
        }
        .content-container {
            display: flex;
            align-items: flex-start;
            width: 100%;
        }
        .image-container {
            position: relative;
            margin-right: 20px;
        }
        .image-container img {
            width: 150px;
            border-radius: 10px;
        }
        .image-container input[type="file"] {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        .content {
            flex-grow: 1;
        }
        .description-card {
            background-color: #f0f0f0;
            padding: 15px;
            border-radius: 10px;
            margin-top: 20px;
            width: 60%;
        }
        .description-card input {
            background-color: #f0f0f0;
            border: none;
            border-radius: 10px;
            padding: 10px;
            font-size: 14px;
            width: 100%;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .description-card input:focus {
            outline: none;
        }
        .additional-cards {
            display: flex;
            justify-content: space-between;
            width: 100%;
            margin-top: 20px;
        }
        .additional-card {
            background-color: #f0f0f0;
            padding: 15px;
            border-radius: 10px;
            width: 20%;
            margin-right: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .additional-card input {
            background-color: #f0f0f0;
            border: none;
            border-radius: 10px;
            padding: 10px;
            font-size: 14px;
            width: 100%;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .additional-card input:focus {
            outline: none;
        }
        .buttons {
            display: flex;
            justify-content: flex-start;
            margin-top: 10px;
        }
        .button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 220px;
        }
        .button.done {
            background-color: #28a745;
            color: white;
        }
        .button.back {
            background-color: #ff4c4c;
            color: white;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <img src="../image/dash-logo.png" alt="Logo">
        <h2>AgriCare</h2>
        <ul>
            <li><img src="../image/dashboard-icon.png" alt="Dashboard Icon"><a href="#dashboard">Dashboard</a></li>
            <li><img src="../image/setting-icon.png" alt="Setting Icon"><a href="farmer-setting.jsp">Setting</a></li>
            <li><img src="../image/History-icon.png" alt="History Icon"><a href="farmer-history.jsp">History</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="header">
            <h1>Agriculture & Organic Market</h1>
            <div class="profile">
                <img src="../image/profile-icon.png" alt="Profile Picture" width="40" height="40">
                <span>Mukesh Kumar</span>
            </div>
        </div>

        <!-- ✅ Product Upload Form -->
        <form action="../FarmerToSell" method="post" enctype="multipart/form-data">
    <div class="card">
        <h2>Sell Your Product</h2>
        <div class="content-container">
            <div class="image-container">
                <img src="../image/product-upload-icon.png" alt="Product Image">
                <input type="file" name="image" accept="image/*" required>
            </div>
            <div class="content">
                <!-- Future use -->
            </div>
        </div>

        <!-- Product Name Textbox -->
        <div class="description-card">
            <input type="text" name="productName" placeholder="Product Name" required>
        </div>

        <!-- Description Textbox -->
        <div class="description-card">
            <input type="text" name="description" placeholder="Write the description of the product" required>
        </div>

        <div class="additional-cards">
            <div class="additional-card">
                <input type="number" name="price" placeholder="Price" required>
            </div>
        </div>

        <!-- Radio buttons for categories in a horizontal card -->
        <div class="additional-cards">
            <div class="additional-card" style="display: flex; justify-content: space-around; align-items: center; padding: 15px; background-color: #f0f0f0; border-radius: 10px;">
                <label><input type="radio" name="category" value="Fruits" required> Fruits</label>
                <label><input type="radio" name="category" value="Vegetables" required> Vegetables</label>
                <label><input type="radio" name="category" value="Cereals" required> Cereals</label>
            </div>
        </div>
    </div>

    <div class="buttons">
        <button type="submit" class="button done">Done</button>
        <button type="button" class="button back" onclick="window.location.href='dashboard.jsp'">Back</button>
    </div>
</form>



    </div>
</body>
</html>

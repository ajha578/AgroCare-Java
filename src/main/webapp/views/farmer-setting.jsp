<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AgriCare Settings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            min-height: 100vh; /* Ensure the body takes up full height of the viewport */
            background-color: #f0f0d8; /* Background of the homepage */
        }
        .sidebar {
            width: 200px;
            background-color: #f0f0d8; /* Same background as the homepage */
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            border-radius: 30px 30px 0 0; /* Radius on the top left and top right sides */
            display: flex;
            flex-direction: column;
            align-items: center; /* Center the content */
            height: 100vh; /* Ensure the sidebar takes up full height */
        }
        .sidebar img {
            max-width: 120px; /* Increased logo size */
            margin-bottom: 10px;
        }
        .sidebar h2 {
            font-size: 18px;
            margin-bottom: 40px;
            text-align: center; /* Center AgriCare */
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
            width: 100%; /* Ensure the icons and text align properly */
            margin-top: 20px; /* Move links a little down */
        }
        .sidebar ul li {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: center; /* Center the list items */
            transition: transform 0.3s ease-in-out; /* Smooth transition for list items */
        }
        .sidebar ul li:hover {
            transform: scale(1.05); /* Scale up the list item when hovered */
        }
        .sidebar ul li img {
            margin-right: 10px; /* Space between icon and text */
            width: 25px;
            height: 25px;
        }
        .sidebar ul li a {
            text-decoration: none;
            color: #333;
            font-size: 18px; /* Increased font size */
        }
        .sidebar ul li a[href="#Setting"] {
            color: #ff9900; /* Change color of "Setting" link */
        }
        .sidebar ul li a[href="#Setting"] + img {
            filter: brightness(0) saturate(100%) invert(47%) sepia(100%) saturate(353%) hue-rotate(343deg) brightness(98%) contrast(91%); /* Change color of "Setting" logo */
        }
        .main-content {
            flex-grow: 1;
            padding: 20px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
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
        .profile-picture {
            margin-bottom: 20px; /* Add space below the profile picture section */
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
            margin-bottom: 20px; /* Add space between text boxes */
        }
        .form-group textarea {
            resize: vertical;
        }
        .profile-buttons {
            display: flex;
            gap: 30px; /* Increase space between buttons */
            margin-top: 10px; /* Add space between profile icon and buttons */
        }
        .change-btn {
            background-color: #009DFF; /* Background color for Change Picture button */
            color: white; /* Text color for Change Picture button */
            border-radius: 5px; /* Border radius for Change Picture button */
            padding: 10px 20px;
        }
        .delete-btn {
            background-color: #D9D9D9; /* Background color for Delete Picture button */
            color: #F43838; /* Text color for Delete Picture button */
            border-radius: 5px; /* Border radius for Delete Picture button */
            padding: 10px 20px;
        }
        .save-btn {
            background-color: #28a745;
            color: #fff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 10px; /* Add radius to Save Changes button */
        }
        .logout-btn {
            background-color: #dc3545;
            color: #fff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 10px; /* Add radius to Logout button */
            float: right;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <img src="../image/dash-logo.png" alt="Logo"> <!-- Replace with your logo path -->
        <h2>AgriCare</h2>
        <ul>
            <li><img src="../image/dashboard-logo.png" alt="Dashboard Icon"><a href="dashboard.jsp">Dashboard</a></li> <!-- Replace with your icons -->
            <li><img src="../image/setting-logo.png" alt="Setting Icon"><a href="#Setting">Setting</a></li>
            <li><img src="../image/History-icon.png" alt="History Icon"><a href="farmer-history.jsp">History</a></li>
        </ul>
    </div>
    <div class="main-content">
        <div class="header">
            <h1>Agriculture & Farmers Market</h1>
        </div>
        <div class="profile-picture">
            <h3>Profile Picture</h3>
            <img src="../image/profile-icon.png" alt="Profile Picture">
            <div class="profile-buttons">
                <button class="change-btn">Change picture</button>
                <button class="delete-btn">Delete picture</button>
            </div>
        </div>
        <div class="form-group">
            <label for="profile-name">Profile name</label>
            <input type="text" id="profile-name" value="Mukesh Kumar">
        </div>
        <div class="form-group">
            <label for="status">Status</label>
            <input type="text" id="status" value="Farmer">
        </div>
        <div class="form-group">
            <label for="about-me">About me</label>
            <textarea id="about-me" rows="4">At AgriCare, I can sell my crops—be it fruits, vegetables, pulses, wheat, or rice—without the interference of middlemen, ensuring I earn a fair profit.</textarea>
        </div>
        <button class="save-btn">Save changes</button>
        <button class="logout-btn"><a href="create-farmer.jsp">Logout</a></button>
    </div>
</body>
</html>

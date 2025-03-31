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
        .sidebar ul li a[href="#History"] {
            color: #ff9900; /* Change color of "History" link */
        }
        .sidebar ul li a[href="#History"] + img {
            filter: brightness(0) saturate(100%) invert(47%) sepia(100%) saturate(353%) hue-rotate(343deg) brightness(98%) contrast(91%); /* Change color of "History" logo */
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
        .card {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }
        .card img {
            max-width: 180px;
            margin-right: 20px;
        }
        .card-content {
            display: flex;
            flex-direction: column;
        }
        .card-content h2 {
            margin: 0;
            font-size: 24px;
            color: #ff9900;
        }
        .card-content p {
            margin: 5px 0;
            font-size: 18px;
        }
        .card-content .status {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <img src="../image/dash-logo.png" alt="Logo"> <!-- Replace with your logo path -->
        <h2>AgriCare</h2>
        <ul>
            <li><img src="../image/dashboard-logo.png" alt="Dashboard Icon"><a href="dashboard.jsp">Dashboard</a></li> <!-- Replace with your icons -->
            <li><img src="../image/setting-icon.png" alt="Setting Icon"><a href="farmer-setting.jsp">Setting</a></li>
            <li><img src="../image/History-icon.png" alt="History Icon"><a href="#History">History</a></li>
        </ul>
    </div>
    <div class="main-content">
        <div class="header">
            <h1>Agriculture & Farmers Market</h1>
            <div class="profile">
                <img src="../image/profile-icon.png" alt="Profile Icon"> <!-- Replace with your profile icon path -->
                <span>Mukesh Kumar</span>
            </div>
        </div>
        <div class="card">
            <img src="../image/onion.png" alt="Onion"> <!-- Replace with your onion image path -->
            <div class="card-content">
                <h2>Onion</h2>
                <p>To Sell</p>
                <p class="status">Status: Active</p>
            </div>
        </div>
    </div>
</body>
</html>

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
            background-color: #f0f0d8; /* Background of the homepage */
        }
        .sidebar {
            width: 200px;
            background-color: #f0f0d8; /* Same background as the homepage */
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            border-top-right-radius: 30px; /* Radius only on the right side */
            border-bottom-right-radius: 10px; /* Radius only on the right side */
            display: flex;
            flex-direction: column;
            align-items: center; /* Center the content */
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
            transition: transform 0.3s ease-in-out; /* Smooth transition */
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
        .card-container {
            display: flex;
            justify-content: space-between;
            gap: 20px; /* Add space between cards */
        }
        .card {
            width: 28%;
            background-color: #fff;
            padding: 20px;
            border-radius: 30px; /* Border radius */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Added box shadow */
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: transform 0.3s ease-in-out; /* Smooth transition */
        }
        .card:hover {
            transform: scale(1.05); /* Scale up the card when hovered */
        }
        .card img {
            width: 90%;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .card h3 {
            font-size: 18px;
            color: #333;
            margin-top: auto; /* Align text equally in all cards */
        }
        .sidebar ul li a[href="#dashboard"] {
            color: #ff9900; /* Change color of "Setting" link */
        }
        .card a {
            text-decoration: none;
            color: inherit; /* Inherit text color */
            display: block; /* Make entire card clickable */
        }

    </style>
</head>
<body>
    <div class="sidebar">
        <img src="../image/dash-logo.png" alt="Logo"> <!-- Replace with your logo path -->
        <h2>AgriCare</h2>
        <ul>
            <li><img src="../image/dashboard-icon.png" alt="Dashboard Icon"><a href="#dashboard">Dashboard</a></li> <!-- Replace with your icons -->
            <li><img src="../image/setting-icon.png" alt="Setting Icon"><a href="farmer-setting.jsp">Setting</a></li> <!-- Update the URL here -->
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
        <div class="card-container">
            <div class="card">
                <a href="farmer-to-sell.jsp">
                    <img src="../image/dimage1.png" alt="To Sell">
                    <img src="../image/dimage2.png" alt="To Sell">
                    <h3>To Sell</h3>
                </a>
            </div>
            <div class="card">
                <a href="farmer-advice.jsp">
                    <img src="../image/dimage3.png" alt="Expert Advice">
                    <img src="../image/dimage4.png" alt="Expert Advice">
                    <h3>Expert Advice</h3>
                </a>
            </div>
            <div class="card">
            	<a href="farmer-weather.jsp">
                <img src="../image/dimage5.png" alt="Weather Forecast">
                <img src="../image/dimage6.png" alt="Weather Forecast">
                <h3>Weather Forecast</h3>
            </div>
        </div>
    </div>
</body>
</html>

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
            min-height: 100vh; /* Ensure the body takes up full height of the viewport */
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
            height: 100vh; /* Ensure the sidebar takes up full height */
        }
        .sidebar img {
            max-width: 120px; /* Increased logo size */
            margin-bottom: 10px;
        }
        .sidebar h2 {
            font-size: 18px;
            margin-bottom: 40px;
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
            justify-content: flex-start; /* Align items to the left */
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
            margin-bottom: 10px; /* Move header closer to the top */
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
            width: 1000px; /* Increased width of main card */
            height: 450px; /* Increased height of main card */
            background-color: #fff;
            padding: 20px;
            border-radius: 30px; /* Border radius */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Added box shadow */
            transition: transform 0.3s ease-in-out; /* Smooth transition */
            margin-bottom: 20px;
            margin-top: 10px; /* Move card up */
            position: relative; /* Ensure absolute positioning works */
            display: flex; /* Use flexbox to align items */
            flex-direction: column; /* Column layout */
            margin-left:20px;
            overflow-y: auto; /* Enable vertical scrolling 
        }
        
            width: 100%;
        }
        .content-container {
            display: flex;
            align-items: flex-start; /* Align items vertically to the top */
            width: 100%;
        }
        .card h2 {
            text-align: center; /* Center the heading */
            }
        .image-container {
            position: relative;
            margin-right: 20px;
        }
        .image-container img {
            width: 250px; /* Width for the image */
            border-radius: 10px;
        }
        .image-container img.icon {
            width: 30px; /* Size of the icon */
            height: 30px;
            position: absolute;
            top: 10px;
            right: 10px; /* Position at the top right corner of the image */
        }
        .additional-card {
            background-color: #f0f0f0;
            padding: 15px;
            border-radius: 10px;
            width: 80%; /* Decreased width of the card inside the main card */
            margin: auto; /* Center the card horizontally */
            display: flex;
            align-items: center; /* Align items to the center */
            margin-top:20px;
            position: relative; /* Ensure absolute positioning works for the chat button */
        }
        .additional-card img {
            width: 150px; /* Decreased size of the image */
            height: auto; /* Maintain aspect ratio */
            margin-right: 20px;
            border-radius: 10px;
        }
        .details {
            flex-grow: 1; /* Allow details to take up remaining space */
        }
        .details p {
            margin: 0; /* Remove margin from paragraphs */
        }
        .buttons {
            display: flex;
            justify-content: flex-start; /* Align buttons to the left */
            margin-top: 10px; /* Move buttons closer to the main card */
        }
        .button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 220px; /* Space between buttons */
        }
        .button.done {
            background-color: #28a745;
            color: white;
        }
        .button.back {
            background-color: #ff4c4c;
            color: white;
        }
        .button.chat {
            position: absolute;
            bottom: 10px;
            right: -50px;
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
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
        <div class="card">
            <h2>Expert Advice</h2>
             <div class="additional-card">
                <img src="../image/doctor1.png" alt="Your Image"> <!-- Replace with your image path -->
                <div class="details">
                    <p><b>Dr. Gurucharan Singh</b> </p>
                    <p>Specialization: Agriculture Expert</p>
                    <p>Experience: 10 years</p>
                    <p>Contact: @example.com</p>
                </div>
                <button class="button chat">Chat</button>
            </div>
            <div class="additional-card">
                <img src="../image/doctor2.png" alt="Your Image"> <!-- Replace with your second image path -->
                <div class="details">
                    <p><b>Dr. K L chadha</b> </p>
                    <p>Specialization: Crop Science</p>
                    <p>Experience: 8 years</p>
                    <p>Contact: anita@example.com</p>
                </div>
                <button class="button chat">Chat</button>
            </div>
            <div class="additional-card">
                <img src="../image/doctor3.png" alt="Your Image"> <!-- Replace with your third image path -->
                <div class="details">
                    <p><b>Dr. Ramesh Patel</b> </p>
                    <p>Specialization: Soil Management</p>
                    <p>Experience: 12 years</p>
                    <p>Contact: ramesh@example.com</p>
                </div>
                <button class="button chat">Chat</button>
            </div>
        </div>
        <div class="buttons">
            <button class="button done">Done</button>
            <button class="button back" onclick="window.location.href='dashboard.jsp'">Back</button>
        </div>
    </div>
</body>
</html>

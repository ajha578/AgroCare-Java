<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AgriCare dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh; /* Ensure the body takes up full height of the viewport */
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
            height: 100%; /* Ensure the sidebar takes up full height */
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
        .sidebar ul li:nth-child(1) a {
            color: #ff9900; /* Change the text color of "Dashboard" to the color of its icon */
        }
        .sidebar ul li:hover {
            transform: scale(1.05); /* Scale up the list item when hovered */
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
            justify-content: center; /* Center the card */
        }
        .card {
            width: 90%; /* Increased card width */
            background-color: #fff;
            padding: 20px;
            border-radius: 30px; /* Border radius */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Added box shadow */
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow-y: auto; /* Enable vertical scroll */
            max-height: 500px; /* Fixed height for the main card */
        }
        .card h3 {
            font-size: 25px;
            color: #333;
            margin-top: 20px; /* Align text equally in all cards */
        }
        .product-list {
            width: 100%;
            text-align: left;
        }
        .product-card {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            background-color: #f0f0f0; /* Light grey background color */
            padding: 10px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .product-details {
            display: flex;
            align-items: center;
        }
        .product img {
            width: 50px;
            height: 50px;
            border-radius: 5px;
            margin-right: 50px; /* Increased space between image and name */
        }
        .product h4 {
            font-size: 16px;
            margin: 0;
        }
        .product hr {
            width: 100%;
            border: 1px solid #ccc;
            margin: 5px 0;
        }
        .product span {
            font-size: 16px;
        }
        .product button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px; /* Increased button size */
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.3s ease-in-out; /* Smooth transition for button */
        }
        .product button:hover {
            transform: scale(1.1); /* Scale up the button when hovered */
        }
        .filter-container {
            display: flex;
            justify-content: center;
            margin-bottom: 40px;
            margin-top: 40px;
        }
        .filter-container label {
            margin-right: 20px;
        }
        #btn{
       
            background-color: green; /* Green background color */
            color: white; /* White text color */
            border: none;
            padding: 15px 80px; /* Increased button size */
            border-radius: 40px;
            cursor: pointer;
            transition: transform 0.3s 
        
        }
        #btn:hover {
            transform: scale(1.1);
            }
            
         .product-details div {
            margin-left: 80px; /* Increased space between image and name */
        }
    </style>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        const vegetablesRadio = document.querySelector('input[name="category"][value="vegetables"]');
        vegetablesRadio.addEventListener('click', function () {
            window.location.href = 'dashboard-buyer-vegetable.jsp';
        });

        const cerealsRadio = document.querySelector('input[name="category"][value="cereals"]');
        cerealsRadio.addEventListener('click', function () {
            window.location.href = 'dashboard-buyer-cereals.jsp';
        });
    });
    </script>
</head>
<body>
    <div class="sidebar">
        <img src="../image/dash-logo.png" alt="Logo"> <!-- Replace with your logo path -->
        <h2>AgriCare</h2>
        <ul>
            <li><img src="../image/dashboard-icon.png" alt="Dashboard Icon"><a href="#">Dashboard</a></li> <!-- Replace with your icons -->
            <li><img src="../image/setting-icon.png" alt="Setting Icon"><a href="buyer-setting.jsp">Setting</a></li>
            <li><img src="../image/History-icon.png" alt="History Icon"><a href="#">History</a></li>
        </ul>
    </div>
    <div class="main-content">
        <div class="header">
            <h1>Agriculture & Organic Market</h1>
            <div class="profile">
                <img src="../image/profile-icon.png" alt="Profile Picture" width="40" height="40">
                <span>Abhi Sharma</span> <!-- Changed name -->
            </div>
        </div>
        <div class="card-container">
            <div class="card">
                <h3>Fresh from the farm to your home!</h3>
                <div class="filter-container">
                    <label><input type="radio" name="category" value="fruits" checked> Fruits</label>
                    <label><input type="radio" name="category" value="vegetables"> Vegetables</label>
                    <label><input type="radio" name="category" value="cereals"> Cereals</label>
                </div>
                <div class="product-list">
                    <div class="product-card">
                        <div class="product-details">
                            <img src="../image/apple.png" alt="Apple">
                            <div>
                                <h4>Apple</h4>
                                <hr>
                                <span>Rs 40/kg</span>
                            </div>
                        </div>
                        <button id="btn">Buy</button>
                    </div>
                    <div class="product-card">
                        <div class="product-details">
                            <img src="../image/banana.png" alt="Banana">
                            <div>
                                <h4>Banana</h4>
                                <hr>
                                <span>Rs 50/kg</span>
                            </div>
                        </div>
                        <button id="btn">Buy</button>
                    </div>
                    <div class="product-card">
                        <div class="product-details">
                            <img src="../image/orange.png" alt="Orange">
                            <div>
                                <h4>Orange</h>                      
                                <hr>
                                <span>Rs 30/kg</span>
                            </div>
                        </div>
                        <button id="btn">Buy</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

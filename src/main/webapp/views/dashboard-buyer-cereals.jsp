<%@ page import="model.ProductDAO,model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ProductDAO dao = new ProductDAO();
    List<Product> cerealProducts = dao.getProductsByCategory("Cereals");
%>
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
        #btn {
            background-color: green; /* Green background color */
            color: white; /* White text color */
            border: none;
            padding: 15px 80px; /* Increased button size */
            border-radius: 40px;
            cursor: pointer;
            transition: transform 0.3s;
        }
        #btn:hover {
            transform: scale(1.1);
        }
        .product-details div {
            margin-left: 80px; /* Increased space between image and name */
        }
        /* Added style for the success message */
        .success-message {
            color: green;
            font-weight: bold;
            margin-left: 10px;
            display: none;
        }
    </style>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        document.querySelector('input[value="fruits"]').addEventListener('click', function () {
            window.location.href = 'dashboard-buyer-fruit.jsp';
        });

        document.querySelector('input[value="vegetables"]').addEventListener('click', function () {
            window.location.href = 'dashboard-buyer-vegetable.jsp';
        });

        document.querySelector('input[value="cereals"]').addEventListener('click', function () {
            window.location.href = 'dashboard-buyer-cereal.jsp';
        });
        
        // Add event listeners to all Buy buttons
        const buyButtons = document.querySelectorAll('.product-card button');
        buyButtons.forEach(button => {
            button.addEventListener('click', function() {
                // Create or show success message
                let message = this.parentElement.querySelector('.success-message');
                if (!message) {
                    message = document.createElement('span');
                    message.className = 'success-message';
                    message.textContent = 'Added to Cart!';
                    this.parentElement.appendChild(message);
                }
                message.style.display = 'inline';
                
                // Hide the message after 2 seconds
                setTimeout(() => {
                    message.style.display = 'none';
                }, 2000);
            });
        });
    });
    </script>
</head>
<body>
    <div class="sidebar">
        <img src="../image/dash-logo.png" alt="Logo">
        <h2>AgriCare</h2>
        <ul>
            <li><img src="../image/dashboard-icon.png" alt="Dashboard Icon"><a href="#">Dashboard</a></li>
            <li><img src="../image/setting-icon.png" alt="Setting Icon"><a href="buyer-setting.jsp">Setting</a></li>
            <li><img src="../image/History-icon.png" alt="History Icon"><a href="buyer-history.jsp">History</a></li>
        </ul>
    </div>
    <div class="main-content">
        <div class="header">
            <h1>Agriculture & Organic Market</h1>
            <div class="profile">
                <img src="../image/profile-icon.png" alt="Profile Picture" width="40" height="40">
                <span>Abhi Sharma</span>
            </div>
        </div>
        <div class="card-container">
            <div class="card">
                <h3>Fresh from the farm to your home!</h3>
                <div class="filter-container">
                    <label><input type="radio" name="category" value="fruits"> Fruits</label>
                    <label><input type="radio" name="category" value="vegetables"> Vegetables</label>
                    <label><input type="radio" name="category" value="cereals" checked> Cereals</label>
                </div>
                <div class="product-list">
                    <% if (cerealProducts != null && !cerealProducts.isEmpty()) {
                        for (Product p : cerealProducts) { %>
                            <div class="product-card">
                                <div class="product-details">
                                    <img src="productImages/<%= p.getImagePath() %>" alt="<%= p.getName() %>">

                                    <div>
                                        <h4><%= p.getName() %></h4>
                                        <hr>
                                        <span>Rs <%= p.getPrice() %>/kg</span>
                                    </div>
                                </div>
                                <button id="btn">Buy</button>
                            </div>
                    <%  }
                    } else { %>
                        <p>No cereal products available at the moment.</p>
                    <% } %>
                </div>
            </div>
        </div>
        <!-- Go to Cart Button -->
<!-- Add this right before the closing </div> tag of the main-content div -->
<div style="margin-top: 30px; text-align: center;">
    <form action="buyer-cart.jsp">
        <button type="submit" style="
            background-color: #28a745;
            color: white;
            border: none;
            padding: 15px 60px;
            border-radius: 30px;
            font-size: 18px;
            cursor: pointer;
            transition: transform 0.3s ease-in-out;
        " onmouseover="this.style.transform='scale(1.1)'" onmouseout="this.style.transform='scale(1)'">
            Go to Cart
        </button>
    </form>
</div>
</div>
    </div>
    
</body>
</html>
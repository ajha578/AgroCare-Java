<%@ page import="java.util.*, model.ProductDAO, model.Product" %>
<%
    List<Product> fruitProducts = ProductDAO.getProductsByCategory("fruits");
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
            height: 100vh;
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
            height: 100%;
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
        .sidebar ul li:nth-child(1) a {
            color: #ff9900;
        }
        .sidebar ul li:hover {
            transform: scale(1.05);
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
            justify-content: center;
        }
        .card {
            width: 90%;
            background-color: #fff;
            padding: 20px;
            border-radius: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow-y: auto;
            max-height: 500px;
        }
        .card h3 {
            font-size: 25px;
            color: #333;
            margin-top: 20px;
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
            background-color: #f0f0f0;
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
            margin-right: 50px;
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
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.3s ease-in-out;
        }
        .product button:hover {
            transform: scale(1.1);
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
            background-color: green;
            color: white;
            border: none;
            padding: 15px 80px;
            border-radius: 40px;
            cursor: pointer;
            transition: transform 0.3s;
        }
        #btn:hover {
            transform: scale(1.1);
        }
        .product-details div {
            margin-left: 80px;
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
        const vegetablesRadio = document.querySelector('input[name="category"][value="vegetables"]');
        vegetablesRadio.addEventListener('click', function () {
            window.location.href = 'dashboard-buyer-vegetable.jsp';
        });

        const cerealsRadio = document.querySelector('input[name="category"][value="cereals"]');
        cerealsRadio.addEventListener('click', function () {
            window.location.href = 'dashboard-buyer-cereals.jsp';
        });
        
        // Add event listeners to all Buy buttons
        const buyButtons = document.querySelectorAll('.product-card button');
        buyButtons.forEach(button => {
            button.addEventListener('click', function(e) {
                // Prevent form submission (for demo purposes)
                e.preventDefault();
                
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
                
                // Here you would normally submit the form to AddToCartServlet
                // For this demo, we're just showing the message
                // Uncomment the next line to actually submit the form:
                // this.parentElement.submit();
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
                    <label><input type="radio" name="category" value="fruits" checked> Fruits</label>
                    <label><input type="radio" name="category" value="vegetables"> Vegetables</label>
                    <label><input type="radio" name="category" value="cereals"> Cereals</label>
                </div>
                <div class="product-list">
                    <%
                        if (fruitProducts != null && !fruitProducts.isEmpty()) {
                            for(Product p : fruitProducts) {
                    %>
                        <div class="product-card">
                            <div class="product-details">
                                <img src="<%= p.getImagePath() %>" alt="<%= p.getName() %>">
                                <div>
                                    <h4><%= p.getName() %></h4>
                                    <hr>
                                    <span>Rs <%= p.getPrice() %>/kg</span>
                                </div>
                            </div>
                            <form action="AddToCartServlet" method="post">
                                <input type="hidden" name="productId" value="<%= p.getId() %>">
                                <button id="btn">Buy</button>
                            </form>
                        </div>
                    <%
                            }
                        } else {
                    %>
                        <p>No fruits available currently.</p>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
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
</body>
</html>
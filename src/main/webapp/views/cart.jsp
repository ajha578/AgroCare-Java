<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AgriCare - Your Cart</title>
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
        .cart-summary {
            width: 100%;
            margin-top: 20px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 10px;
            text-align: right;
        }
        .checkout-btn {
            background-color: #ff9900;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 30px;
            font-size: 18px;
            cursor: pointer;
            margin-top: 20px;
            transition: transform 0.3s;
        }
        .checkout-btn:hover {
            transform: scale(1.05);
            background-color: #e68a00;
        }
        .empty-cart-message {
            text-align: center;
            font-size: 18px;
            color: #666;
            margin: 40px 0;
        }
        .quantity-input {
            width: 50px;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .remove-btn {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <img src="../image/dash-logo.png" alt="Logo">
        <h2>AgriCare</h2>
        <ul>
            <li><img src="../image/dashboard-icon.png" alt="Dashboard Icon"><a href="dashboard-buyer-fruit.jsp">Dashboard</a></li>
            <li><img src="../image/setting-icon.png" alt="Setting Icon"><a href="buyer-setting.jsp">Setting</a></li>
            <li><img src="../image/History-icon.png" alt="History Icon"><a href="#">History</a></li>
        </ul>
    </div>
    <div class="main-content">
        <div class="header">
            <h1>Your Shopping Cart</h1>
            <div class="profile">
                <img src="../image/profile-icon.png" alt="Profile Picture" width="40" height="40">
                <span>Abhi Sharma</span>
            </div>
        </div>
        <div class="card-container">
            <div class="card">
                <h3>Welcome to cart</h3>
                
                <!-- Example cart item - you would loop through actual cart items here -->
                <div class="product-list">
                    <!-- Sample Cart Item 1 -->
                    <div class="product-card">
                        <div class="product-details">
                            <img src="../image/apple.jpg" alt="Apple">
                            <div>
                                <h4>Fresh Apples</h4>
                                <hr>
                                <span>Rs 120/kg</span>
                            </div>
                        </div>
                        <div style="display: flex; align-items: center;">
                            <input type="number" value="1" min="1" class="quantity-input">
                            <button class="remove-btn">Remove</button>
                        </div>
                    </div>
                    
                    <!-- Sample Cart Item 2 -->
                    <div class="product-card">
                        <div class="product-details">
                            <img src="../image/carrot.jpg" alt="Carrot">
                            <div>
                                <h4>Organic Carrots</h4>
                                <hr>
                                <span>Rs 80/kg</span>
                            </div>
                        </div>
                        <div style="display: flex; align-items: center;">
                            <input type="number" value="2" min="1" class="quantity-input">
                            <button class="remove-btn">Remove</button>
                        </div>
                    </div>
                    
                    <!-- Cart Summary -->
                    <div class="cart-summary">
                        <h3>Order Summary</h3>
                        <hr>
                        <p>Total Items: 2</p>
                        <p>Total Price: Rs 280</p>
                        <button class="checkout-btn">Proceed to Checkout</button>
                    </div>
                    
                    <!-- Empty Cart State (commented out) -->
                    <!--
                    <div class="empty-cart-message">
                        <p>Your cart is empty</p>
                        <p>Continue shopping to add items to your cart</p>
                        <a href="dashboard-buyer-fruit.jsp" style="color: #28a745; text-decoration: none;">← Back to Shopping</a>
                    </div>
                    -->
                </div>
            </div>
        </div>
    </div>
</body>
</html>
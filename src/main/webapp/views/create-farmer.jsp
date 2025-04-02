<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create an Account</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .wrapper {
            display: flex;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .left-panel {
            background-image: url('../image/create.png'); /* Replace with your image path */
            background-size: 150%; /* Zoom out the image */
            background-position: center;
            width: 300px;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
        }
        .right-panel {
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            width: 300px; /* Adjust the width as needed */
        }
        .logo {
            text-align: center;
            margin-bottom: 20px;
        }
        .logo img {
            max-width: 100px; /* Adjust logo size as needed */
        }
        .title {
            font-size: 24px;
            margin-bottom: 10px; /* Reduced margin to fit the additional text */
            text-align: center;
        }
        .sub-title {
            font-size: 16px;
            margin-bottom: 20px;
            text-align: center;
            color: #555; /* Optional: Add a subtle color for the sub-title */
        }
        .role-selection {
            margin-bottom: 15px;
            text-align: center;
        }
        .input-group {
            margin-bottom: 20px; /* Increased space between input groups */
        }
        .input-group label {
            display: block;
            margin-bottom: 5px;
        }
        .input-group input {
            width: 90%; /* Decreased size of the textboxes */
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 10px; /* Added border-radius */
            background-color: #d3d3d3; /* Grey color for the textboxes */
            margin: 0 auto; /* Center the textboxes */
        }
        .button {
            width: 80%; /* Decreased button size */
            padding: 12px;
            background-color: #B08B12; /* Darker button color */
            color: black; /* Changed text color to black */
            border: none;
            border-radius: 30px; /* Added more border-radius */
            cursor: pointer;
            font-size: 16px; /* Increased font size */
            font-weight: bold; /* Bold font */
            margin: 0 auto; /* Center the button */
        }
        .button:hover {
            background-color: #8A6811;
        }
        .link {
            margin-top: 10px;
            text-align: center;
            color: black; /* Changed to black */
            font-weight: normal; /* Normal font */
        }
        .link a {
            color: black; /* Ensure link color matches */
            text-decoration: none;
            font-weight: bold; /* Login in bold */
        }
    </style>
    <script>
        function validateForm() {
            const name = document.getElementById('name').value;
            const phone = document.getElementById('phone').value;
            const password = document.getElementById('password').value;

            if (!name || !phone || !password) {
                alert('All fields are required!');
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="wrapper">
        <div class="left-panel"></div>
        <div class="right-panel">
            <div class="logo">
                <img src="../image/create-logo.png" alt="Logo"> <!-- Replace with your logo path -->
            </div>
            <div class="title">Create an account</div>
            <div class="sub-title">Choose your role below</div>
            <div class="role-selection">
                <label>
                    <input type="radio" name="role" value="buyer" onclick="window.location.href='create-buyer.jsp'"> Buyer
                </label>
                <label>
                    <input type="radio" name="role" value="farmer" checked> Farmer
                </label>
            </div>
            <form action="<%= request.getContextPath() %>/Registerfarmer" method="post" onsubmit="return validateForm()">
                <div class="input-group">
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name">
                </div>
                <div class="input-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone">
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password">
                </div>
                <button class="button" type="submit">Create Account</button>
            </form>
            <div class="link">
                Already have an account? <a href="login-farmer.jsp">Login</a>
            </div>
        </div>
    </div>
</body>
</html>

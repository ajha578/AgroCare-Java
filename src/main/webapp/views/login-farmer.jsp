<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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
        .role-selection {
            margin-bottom: 15px;
            text-align: center;
        }
        .role-selection-title {
            font-size: 16px;
            margin-bottom: 5px;
        }
        .input-group {
            margin-bottom: 15px;
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
            font-weight: bold; /* Signup in bold */
        }
    </style>
    <script>
        function handleRoleChange(event) {
            if (event.target.value === 'buyer') {
                window.location.href = 'login-buyer.jsp';
            }
        }

        function handleSubmit() {
            window.location.href = 'dashboard.jsp';
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
            <div class="title">Login</div>
            <div class="role-selection">
                <div class="role-selection-title">Choose your role</div>
                <label>
                    <input type="radio" name="role" value="buyer" onclick="handleRoleChange(event)"> Buyer
                </label>
                <label>
                    <input type="radio" name="role" value="farmer" checked> Farmer
                </label>
            </div>
            <div class="input-group">
                <label for="email">Phone no</label>
                <input type="number" id="email">
                <label for="password">Password</label>
                <input type="password" id="password">
            </div>
            <button class="button" onclick="handleSubmit()">Login</button>
            <div class="link">
                Don't have an account? <a href="create-farmer.jsp">Signup</a>
            </div>
        </div>
    </div>
</body>
</html>

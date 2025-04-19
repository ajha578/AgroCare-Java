<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color:  #b8d8b8; /* Added a light greenish background color */
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
            background-image: url('../image/create.png'); /* Adjusted relative path for background */
            background-size: cover;
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
            width: 300px;
        }
        .logo {
            text-align: center;
            margin-bottom: 20px;
        }
        .logo img {
            max-width: 100px;
        }
        .title {
            font-size: 24px;
            margin-bottom: 10px;
            text-align: center;
            font-weight: bold;
            color: #333;
        }
        .input-group {
            margin-bottom: 15px;
        }
        .input-group label {
            display: block;
            margin-bottom: 5px;
        }
        .input-group input {
            width: 90%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #d3d3d3;
        }
        .button {
            width: 80%;
            padding: 12px;
            background-color: #0056b3; /* Admin-specific color */
            color: white;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            margin: 0 auto;
            position: relative;
            left: 20px; /* Moves the button 20px to the right */
        }
        .button:hover {
            background-color: #004085;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 10px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="left-panel"></div>
        <div class="right-panel">
            <div class="logo">
                <img src="../image/logo.png" alt="Admin Logo"> <!-- Adjusted relative path for logo -->
            </div>
            <div class="title">Admin Login</div>
            <!-- Display Error Message -->
            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %>
                <p class="error-message"><%= errorMessage %></p>
            <%
                }
            %>
            <!-- Login Form -->
            <form action="<%= request.getContextPath() %>/AdminLoginServlet" method="post">
             <div class="input-group">
                    <label for="email">Admin Email</label>
                    <input type="email" id="email" name="email" autocomplete="off" required>

                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" autocomplete="new-password" required>
                </div>
                <button class="button" type="submit">Login</button>
            </form>
        </div>
    </div>
</body>
</html>

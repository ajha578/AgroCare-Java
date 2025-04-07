<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
            background-image: url('<%= request.getContextPath() %>/image/create.png'); /* Dynamic path */
            background-size: 150%;
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
        }
        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 10px;
            font-weight: bold;
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
            background-color: #B08B12;
            color: black;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            margin: 0 auto;
        }
        .button:hover {
            background-color: #8A6811;
        }
        .link {
            margin-top: 10px;
            text-align: center;
            color: black;
        }
        .link a {
            color: black;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
    <script>
        // Function to clear error messages when switching roles
        function clearErrorMessage() {
            const errorMessageElement = document.querySelector('.error-message');
            if (errorMessageElement) {
                errorMessageElement.textContent = ''; // Clear error message
            }
        }
    </script>
</head>
<body>
    <div class="wrapper">
        <div class="left-panel"></div>
        <div class="right-panel">
            <div class="logo">
                <img src="<%= request.getContextPath() %>/image/create-logo.png" alt="Logo">
            </div>
            <div class="title">Login</div>
            <!-- Role Selection Section -->
            <div class="role-selection">
                <div class="role-selection-title">Choose your role</div>
                <label>
                    <input type="radio" name="role" value="buyer" onclick="window.location.href='<%= request.getContextPath() %>/views/login-buyer.jsp'"> Buyer
                </label>
                <label>
                    <input type="radio" name="role" value="farmer" checked onclick="clearErrorMessage();"> Farmer
                </label>
            </div>
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
            <form action="<%= request.getContextPath() %>/loginfarmer" method="post">
                <div class="input-group">
                    <label for="phone">Phone no</label>
                    <input type="text" id="phone" name="phone" autocomplete="off"
                           value="<%= (request.getAttribute("errorMessage") != null) ? request.getAttribute("enteredPhone") : "" %>" required>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" autocomplete="new-password"
                           value="<%= (request.getAttribute("errorMessage") != null) ? request.getAttribute("enteredPassword") : "" %>" required>
                </div>
                <button class="button" type="submit">Login</button>
            </form>
            <div class="link">
                Don't have an account? <a href="<%= request.getContextPath() %>/views/create-farmer.jsp">Signup</a>
            </div>
        </div>
    </div>
</body>
</html>

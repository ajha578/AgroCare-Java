<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Prevent caching to avoid browser retaining previous form data
    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
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
            background-image: url('<%= request.getContextPath() %>/image/create.png');
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
        .sub-title {
            font-size: 16px;
            margin-bottom: 20px;
            text-align: center;
            color: #555;
        }
        .role-selection {
            margin-bottom: 15px;
            text-align: center;
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
            margin: 0 auto;
        }
        .gender-selection {
            margin-bottom: 15px;
        }
        .gender-selection label {
            margin-right: 10px;
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
        function handleRoleChange(event) {
            if (event.target.value === 'farmer') {
                // Redirect to create-farmer.jsp
                 window.location.href = '<%= request.getContextPath() %>/views/create-farmer.jsp';
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
            <div class="title">Create an account</div>
            <div class="sub-title">Choose your role below</div>
            <div class="role-selection">
                <label>
                    <input type="radio" name="role" value="buyer" checked> Buyer
                </label>
                <label>
                    <input type="radio" name="role" value="farmer" onclick="handleRoleChange(event)"> Farmer
                </label>
            </div>

            <% 
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %>
                <div style="color: red; text-align: center;"><%= errorMessage %></div>
            <% } %>

            <form action="<%= request.getContextPath() %>/RegisterServlet" method="post" autocomplete="off">
                <div class="input-group">
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" value="" required autocomplete="off">

                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="" required autocomplete="new-email">

                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" value="" required autocomplete="new-password">
                </div>

                <div class="gender-selection">
                    <label>Gender</label><br>
                    <label>
                        <input type="radio" name="gender" value="male" required> Male
                    </label>
                    <label>
                        <input type="radio" name="gender" value="female" required> Female
                    </label>
                </div>

                <button class="button" type="submit">Create Account</button>
            </form>

            <div class="link">
                Already have an account? <a href="login-buyer.jsp">Login</a>
            </div>
        </div>
    </div>
</body>
</html>

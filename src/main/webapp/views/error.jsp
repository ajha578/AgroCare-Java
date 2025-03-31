<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error Page</title>
</head>
<body>
    <h1>Oops! An error occurred.</h1>
    <p><%= request.getAttribute("errorMessage") %></p>
    <p><a href="index.jsp">Go Back to Home</a></p>
</body>
</html>

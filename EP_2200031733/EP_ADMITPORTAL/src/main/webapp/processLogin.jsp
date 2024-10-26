<!-- processLogin.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Result</title>
    <link rel="stylesheet" type="text/css" href="path/to/style.css">
</head>
<style>
/* CSS styles for login result page */

body {
    font-family: Arial, sans-serif;
    text-align: center;
}

h1 {
    color: #007bff; /* Change the font color of the heading */
}

p {
    color: #333; /* Change the font color of the paragraphs */
}

a {
    color: #007bff; /* Change the color of links */
    text-decoration: none; /* Remove underlines from links */
}

a:hover {
    text-decoration: underline; /* Add underline on hover for links */
}

</style>
<body>
    <%-- Get form data from the request --%>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Sample authentication logic (Replace this with actual authentication mechanism)
        boolean isAuthenticated = false;
        if (username.equals("your_username") && password.equals("your_password")) {
            isAuthenticated = true;
        }
    %>

    <h1>Login Result</h1>
    <%-- Display login result --%>
    <% if (isAuthenticated) { %>
        <p>Welcome, <%= username %>! You are now logged in.</p>
        <p><a href="studentInfo.jsp">Proceed to Student Information</a></p>
    <% } else { %>
        <p>Invalid username or password. Please try again.</p>
        <p><a href="login.jsp">Go back to Login</a></p>
    <% } %>
</body>
</html>
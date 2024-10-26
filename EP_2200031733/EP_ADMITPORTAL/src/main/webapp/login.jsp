<!-- login.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="path/to/style.css">
</head>
<style>
/* CSS styles for the Login page */

body {
  background-image: url('https://img.freepik.com/free-photo/3d-render-low-poly-design-abstract-blur-background_1048-12681.jpg?w=900&t=st=1690008942~exp=1690009542~hmac=a506db200ae555c8f244ef0b808beafdf060fc142be6e8850c066f8b34b32b08');
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
  margin: 0;
  padding: 0;
  opacity: 0.8;
}

h1 {
  text-align: center;
  margin-top: 50px;
  color: #333;
}

form {
  max-width: 400px;
  margin: 0 auto;
  padding: 20px;
  background-color: #fff;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

label {
  font-weight: bold;
  display: block;
  margin-bottom: 5px;
  color: #333;
}

input[type="text"],
input[type="password"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

input[type="submit"] {
  width: 100%;
  background-color: #00b7eb;
  color: white;
  padding: 10px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

input[type="submit"]:hover {
  background-color: #45a049;
}

</style>
<body>
    <h1>Login</h1>
    <form action="processLogin.jsp" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>

        <input type="submit" value="Login">
    </form>
</body>
</html>
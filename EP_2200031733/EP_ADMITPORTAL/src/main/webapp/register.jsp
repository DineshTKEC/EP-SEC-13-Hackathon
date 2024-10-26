<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- register.jsp -->
<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
</head>
<style>
/* CSS styles for the Student Registration page */

body {
  background-image: url('https://wallpapercave.com/wp/wp7181995.jpg'); /* Replace 'path/to/your/background-image.jpg' with the actual path to your background image file */
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
  font-family: Arial, sans-serif;
  color: #333;
}

/* Center the form on the page */
form {
  max-width: 400px;
  margin: 0 auto;
  padding: 20px;
  background-color: rgba(255, 255, 255, 0.8); /* Add a semi-transparent background to the form */
  border: 8px solid #ccc;
  border-radius: 5px;
}

/* Style for the h1 heading */
h1 {
  text-align: center;
  margin-bottom: 20px;
}

/* Style for the labels */
label {
  font-weight: bold;
}

/* Style for the input fields */
input {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

/* Style for the Submit button */
input[type="submit"] {
  background-color: #4CAF50;
  color: white;
  cursor: pointer;
}

/* Additional styles for the Submit button on hover */
input[type="submit"]:hover {
  background-color: #45a049;
}

/* Style for the success message */
p.success-message {
  color: green;
  font-weight: bold;
}

/* Style for the link to go back to the home page */
p a {
  color: #4CAF50;
  text-decoration: none;
}

</style>
<body>
    <h1>Student Registration</h1>
    <form action="processRegistration.jsp" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="fullname">Full Name:</label>
        <input type="text" id="fullname" name="fullname" required><br>

        <label for="course">Course:</label>
        <input type="text" id="course" name="course" required><br>

        <input type="submit" value="Register">
        
        <p><a href="login.jsp">Already an user? Login!!</a></p>
    </form>
</body>
</html>
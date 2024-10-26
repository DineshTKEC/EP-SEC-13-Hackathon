<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- applicationForm.jsp -->
<html>
<head>
    <title>Admission Application Form</title>
</head>

<style>

/* style.css */

/* Set background image */
body {
    background-image: url("https://png.pngtree.com/thumb_back/fw800/back_our/20190617/ourmid/pngtree-fresh-admission-notice-cover-background-image_127885.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    margin: 0; /* Optional: Reset default margin for body element */
}

/* Add styles for the h1 element */
h1 {
    text-align: center;
    margin-top: 150px;
    margin-left:320px;
}

/* Add styles for the form */
form {
    max-width: 400px;
    margin: 50px auto;
    padding: 50px;
    border: 1px solid #ccc;
    background-color: #f9f9f9;
    
    margin-left:700px;
    
}

/* Add styles for the input fields and submit button */
input[type="text"],
input[type="email"],
input[type="submit"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
      margin-left: auto;
  margin-right: auto;
    
}

input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

</style>

<body>
    <h1>Admission Application Form</h1>
    <form action="submitApplication.jsp" method="post">
        <!-- Form fields for name, email, course, etc. -->
        <input type="text" name="name" placeholder="Name">
        <input type="email" name="email" placeholder="Email">
        <input type="text" name="course" placeholder="Course">
        <!-- Submit button -->
        <input type="submit" value="Submit Application">
    </form>
</body>
</html>

</html>
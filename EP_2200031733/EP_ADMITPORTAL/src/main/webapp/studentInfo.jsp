<!-- studentInfo.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Information</title>
</head>
<style>
/* CSS for the form container */
body {
  font-family: Arial, sans-serif;
  max-width: 700px;
  margin: 0 auto;
  padding: 20px;
}

/* CSS for the form heading */
h1 {
  color: #336699;
  text-align: center;
}

/* CSS for form labels and inputs */
label {
  display: block;
  margin-top: 10px;
  font-weight: bold;
}

input[type="text"],
input[type="number"],
input[type="email"],
textarea {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  margin-top: 5px;
}

input[type="radio"] {
  margin-right: 5px;
}

/* CSS for form submit button */
input[type="submit"] {
  background-color: #336699;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin-top: 10px;
}

input[type="submit"]:hover {
  background-color: #2a4e78;
}

/* CSS for form validation messages */
input:invalid {
  border-color: #ff6666;
}

input:valid {
  border-color: #ccc;
}

/* CSS for form layout and spacing */
form {
  display: grid;
  gap: 3px;
}
</style>
<body>
    <h1>Student Information</h1>
    <form action="processStudentInfo.jsp" method="post">
        <label for="fullName">Full Name:</label>
        <input type="text" id="fullName" name="fullName" required><br>

        <label for="gender">Gender:</label>
        <input type="radio" id="male" name="gender" value="Male" required>
        <label for="male">Male</label>
        <input type="radio" id="female" name="gender" value="Female" required>
        <label for="female">Female</label>
        <input type="radio" id="other" name="gender" value="Other" required>
        <label for="other">Other</label><br>

        <label for="fatherName">Father's Name:</label>
        <input type="text" id="fatherName" name="fatherName" required><br>

        <label for="motherName">Mother's Name:</label>
        <input type="text" id="motherName" name="motherName" required><br>

        <label for="studentPhone">Student Phone Number:</label>
        <input type="text" id="studentPhone" name="studentPhone" required><br>

        <label for="fatherMobile">Father's Mobile Number:</label>
        <input type="text" id="fatherMobile" name="fatherMobile" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="age">Age:</label>
        <input type="number" id="age" name="age" required><br>

        <label for="dateOfBirth">Date of Birth:</label>
        <input type="date" id="dateOfBirth" name="dateOfBirth" required><br>

        <label for="address">Address:</label>
        <textarea id="address" name="address" rows="4" cols="50" required></textarea><br>

        <label for="sscMarks">10th SSC Marks:</label>
        <input type="text" id="sscMarks" name="sscMarks" required><br>

        <label for="interMarks">Intermediate Marks:</label>
        <input type="text" id="interMarks" name="interMarks" required><br>

        <label for="eamcetRank">EAMCET Rank:</label>
        <input type="text" id="eamcetRank" name="eamcetRank" required><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
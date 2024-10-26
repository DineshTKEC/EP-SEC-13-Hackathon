<!-- eligibilityCriteria.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Eligibility Criteria</title>
</head>
<style>
/* CSS for the form container */
body {
  font-family: Arial, sans-serif;
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
}

/* CSS for the form heading */
h1 {
  color: #336699;
  text-align: center;
}

/* CSS for form labels and selects */
label {
  display: block;
  margin-top: 10px;
  font-weight: bold;
}

select {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  margin-top: 5px;
}

/* CSS for form checkboxes */
input[type="checkbox"] {
  margin-right: 5px;
}

/* CSS for form input */
input[type="number"] {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  margin-top: 5px;
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

/* CSS for form layout and spacing */
form {
  display: grid;
  gap: 10px;
}
</style>
<body>
    <h1>Eligibility Criteria</h1>
    <form action="processEligibility.jsp" method="post">
        <label for="course">Select Course:</label>
        <select id="course" name="course">
            <option value="engineering">Engineering</option>
            <option value="medical">Medical</option>
            <option value="agriculture">Agriculture</option>
            <!-- Add more course options as needed -->
        </select><br>

        <label>Preferred Colleges (Choose any three):</label><br>
        <input type="checkbox" name="college" value="college1"> College 1<br>
        <input type="checkbox" name="college" value="college2"> College 2<br>
        <input type="checkbox" name="college" value="college3"> College 3<br>
        <!-- Add more college options as needed -->

        <label for="eamcetRank">EAMCET Rank:</label>
        <input type="number" id="eamcetRank" name="eamcetRank" required><br>

        <input type="submit" value="Check Eligibility">
    </form>
</body>
</html>
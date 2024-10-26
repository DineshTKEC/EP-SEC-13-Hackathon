<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- colleges.jsp -->
<!DOCTYPE html>
<html>
<head>
    <title>Available Colleges</title>
</head>
<style>
/* CSS for the table */
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  border: 1px solid black;
  padding: 8px;
}

th {
  background-color: #f2f2f2;
}

/* CSS for the heading */
h1 {
  color: #336699;
  text-align: center;
}

/* CSS for the table headings */
th {
  background-color: #f2f2f2;
  color: #333;
  font-weight: bold;
}
</style>
<body>
    <h1>Available Colleges for Higher Education</h1>
    <table>
        <tr>
            <th>College Name</th>
            <th>Location</th>
            <th>Available Courses</th>
        </tr>
        <c:forEach var="college" items="${colleges}">
            <tr>
                <td>K L UNIVERSITY</td>
                <td> Vijayawada</td>
                <td>All Btech courses</td>
            </tr>
            <tr>
                <td>K L UNIVERSITY</td>
                <td> Hyderabad</td>
                <td>All Btech courses</td>
            </tr>
            <tr>
                <td>JNTU </td>
                <td> Warangal </td>
                <td>All Btech courses</td>
            </tr>
            
        </c:forEach>
    </table>
</body>
</html>
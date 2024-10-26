<%@ page import="java.sql.*" %>

<%
// Retrieve form data
String name = request.getParameter("name");
String email = request.getParameter("email");
String course = request.getParameter("course");

// Database connection parameters
String dbURL = "jdbc:mysql://localhost:3306/admission_form";
String dbUser = "root";
String dbPassword = "Chinni@44";

try {
    // Load the MySQL JDBC driver
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Create a connection to the database
    Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

    // Save form data to the database
    String insertQuery = "INSERT INTO application_form (name, email, course) VALUES (?, ?, ?)";
    PreparedStatement statement = conn.prepareStatement(insertQuery);
    statement.setString(1, name);
    statement.setString(2, email);
    statement.setString(3, course);
    statement.executeUpdate();

    // Close the connection
    conn.close();

    response.sendRedirect("success.jsp"); // Redirect to a success page after form submission
} catch (ClassNotFoundException e) {
    e.printStackTrace();
    response.sendRedirect("err.jsp"); // Redirect to an error page if the JDBC driver is not found
} catch (SQLException e) {
    e.printStackTrace();
    response.sendRedirect("error.jsp"); // Redirect to an error page if a database error occurs
}
%>

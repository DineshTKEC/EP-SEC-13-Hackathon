<%@ page import="com.airline.reservation.dao.PassengerDAO" %>
<%@ page import="com.airline.reservation.model.Passenger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Passenger</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #007BFF;
        }

        form {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        input[type="text"], input[type="email"], input[type="tel"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<h2>Edit Passenger</h2>

<%
    // Get passenger ID from request parameter
    int passengerId = Integer.parseInt(request.getParameter("id"));

    // Fetch passenger details from database using DAO
    PassengerDAO passengerDAO = new PassengerDAO();
    Passenger passenger = passengerDAO.getPassengerById(passengerId);
%>

<form action="updatePassenger" method="post">
    <input type="hidden" name="id" value="<%= passenger.getId() %>" />

    <label for="name">Name:</label>
    <input type="text" id="name" name="name" value="<%= passenger.getName() %>" required />

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="<%= passenger.getEmail() %>" required />

    <label for="phone">Phone:</label>
    <input type="tel" id="phone" name="phone" value="<%= passenger.getPhone() %>" required />

    <button type="submit">Update Passenger</button>
</form>

</body>
</html>

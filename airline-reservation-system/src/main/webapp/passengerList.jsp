<%@ page import="java.util.List" %>
<%@ page import="com.airline.reservation.dao.PassengerDAO" %>
<%@ page import="com.airline.reservation.model.Passenger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Passenger List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #007BFF;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e1e1e1;
        }

        .add-button {
            display: block;
            width: 200px;
            margin: 20px auto;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .add-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<h2>Passenger List</h2>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <%
            PassengerDAO passengerDAO = new PassengerDAO();
            List<Passenger> passengerList = passengerDAO.getAllPassengers();
            for (Passenger passenger : passengerList) {
        %>
        <tr>
            <td><%= passenger.getId() %></td>
            <td><%= passenger.getName() %></td>
            <td><%= passenger.getEmail() %></td>
            <td><%= passenger.getPhone() %></td>
            <td>
                <a href="editPassenger.jsp?id=<%= passenger.getId() %>">Edit</a>
                <a href="deletePassenger?id=<%= passenger.getId() %>">Delete</a>

            </td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

<a class="add-button" href="addPassenger.jsp">Add New Passenger</a>

</body>
</html>

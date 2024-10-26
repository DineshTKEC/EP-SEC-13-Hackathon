<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Instructors</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/style.css">
</head>
<body>
    <div class="container">
        <h1 class="heading">Course Management System</h1>
        <h2 class="heading">Manage Instructors</h2>
        <nav class="nav">
            <ul>
                <li><a href="/admin/addInstructor" class="btn">Add New Instructor</a></li>
                <li><a href="/admin">Back to Admin Dashboard</a></li>
            </ul>
        </nav>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Username</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${instructors}" var="instructor">
                        <tr>
                            <td>${instructor.id}</td>
                            <td>${instructor.name}</td>
                            <td>${instructor.email}</td>
                            <td>${instructor.username}</td>
                            <td>
                                <a href="/admin/editInstructor/${instructor.id}" class="btn btn-small">Edit</a>
                                <a href="/admin/deleteInstructor/${instructor.id}" class="btn btn-small btn-danger" onclick="return confirm('Are you sure you want to delete this instructor?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>

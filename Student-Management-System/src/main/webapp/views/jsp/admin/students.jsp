<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Students</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/style.css">
</head>
<body>
    <div class="container">
        <h1 class="heading">Course Management System</h1>
        <h2 class="heading">Manage Students</h2>
        <nav class="nav">
            <ul>
                <li><a href="/admin/addStudent" class="btn">Add New Student</a></li>
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
                    <c:forEach items="${students}" var="student">
                        <tr>
                            <td>${student.id}</td>
                            <td>${student.name}</td>
                            <td>${student.email}</td>
                            <td>${student.username}</td>
                            <td>
                                <a href="/admin/editStudent/${student.id}" class="btn btn-small">Edit</a>
                                <a href="/admin/deleteStudent/${student.id}" class="btn btn-small btn-danger" onclick="return confirm('Are you sure you want to delete this student?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>

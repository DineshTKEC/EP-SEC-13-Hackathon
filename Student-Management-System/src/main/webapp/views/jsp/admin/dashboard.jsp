<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/style.css">
</head>
<body>
    <div class="container">
        <h1 class="heading">Course Management System</h1>
        <h2 class="heading">Admin Dashboard</h2>
        <nav class="nav">
            <ul>
                <li><a href="/admin/students">Manage Students</a></li>
                <li><a href="/admin/instructors">Manage Instructors</a></li>
                <li><a href="/admin/courses">Manage Courses</a></li>
                <li><a href="/">Home</a></li>
            </ul>
        </nav>
        <div class="dashboard-content">
            <h3>Welcome, Administrator!</h3>
            <p>Here you can manage students, instructors, and courses.</p>
        </div>
    </div>
</body>
</html>

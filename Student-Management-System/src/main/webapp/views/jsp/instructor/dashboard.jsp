<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instructor Dashboard</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/style.css">
</head>
<body>
    <div class="container">
        <h1 class="heading">Course Management System</h1>
        <h2 class="heading">Instructor Dashboard</h2>
        <nav class="nav">
            <ul>
                <li><a href="/instructor/courses">My Courses</a></li>
                <li><a href="/instructor/assignments">Assignments</a></li>
                <li><a href="/">Home</a></li>
            </ul>
        </nav>
        <div class="dashboard-content">
            <h3>Welcome, Instructor!</h3>
            <p>Here you can manage your courses and assignments.</p>
        </div>
    </div>
</body>
</html>

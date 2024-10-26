<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Management System - Home</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/style.css">
</head>
<body>
    <div class="container">
        <h1 class="heading">Course Management System</h1>
        <h2 class="heading">Welcome to the Home Page</h2>
        <div class="nav-container">
            <h3>Administrator</h3>
            <ul class="nav">
                <li><a href="/admin">Admin Dashboard</a></li>
                <li><a href="/admin/students">Manage Students</a></li>
                <li><a href="/admin/instructors">Manage Instructors</a></li>
                <li><a href="/admin/courses">Manage Courses</a></li>
            </ul>

            <h3>Instructor</h3>
            <ul class="nav">
                <li><a href="/instructor">Instructor Dashboard</a></li>
                <li><a href="/instructor/courses">My Courses</a></li>
                <li><a href="/instructor/assignments">Assignments</a></li>
            </ul>

            <h3>Student</h3>
            <ul class="nav">
                <li><a href="/viewAllCourses">View All Courses</a></li>
                <li><a href="/student/registerCourse">Register for a Course</a></li>
            </ul>
        </div>
    </div>
    <div>${PrintSwal}</div>
</body>
</html>

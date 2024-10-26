<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register for a Course</title>
    <style type="text/css">
        <%@ include file="/views/css/style.css"%>
    </style>
</head>
<body>
    <div class="container">
        <h1 class="heading">Course Management System</h1>
        <h2 class="heading">Register for a Course</h2>
        <form action="/student/registerCourse" method="post">
            <label for="student">Select a Student:</label>
            <select id="student" name="studentId" required>
                <option value="">Choose a student</option>
                <c:forEach items="${students}" var="student">
                    <option value="${student.id}">${student.name}</option>
                </c:forEach>
            </select>
            <br><br>
            <label for="course">Select a Course:</label>
            <select id="course" name="courseId" required>
                <option value="">Choose a course</option>
                <c:forEach items="${courses}" var="course">
                    <option value="${course.courseNo}">${course.courseName} - Starts: ${course.startDate}, Duration: ${course.duration} weeks</option>
                </c:forEach>
            </select>
            <br><br>
            <input type="submit" value="Register">
        </form>
        <a href="/">Back to Home</a>
    </div>
</body>
</html>

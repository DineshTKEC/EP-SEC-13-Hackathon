<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Course</title>
    <style type="text/css">
        <%@ include file="/views/css/style.css"%>
    </style>
</head>
<body>
    <div class="container">
        <h1 class="heading">Course Management System</h1>
        <h2 class="heading">Add New Course</h2>
        <form action="/admin/addCourse" method="post">
            <label for="courseName">Course Name:</label>
            <input type="text" id="courseName" name="courseName" required><br><br>
            
            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" name="startDate" required><br><br>
            
            <label for="duration">Duration (weeks):</label>
            <input type="number" id="duration" name="duration" required><br><br>
            
            <label for="instructor">Instructor:</label>
            <select id="instructor" name="instructor.id">
                <option value="">Select Instructor</option>
                <c:forEach items="${instructors}" var="instructor">
                    <option value="${instructor.id}">${instructor.name}</option>
                </c:forEach>
            </select><br><br>
            
            <input type="submit" value="Add Course">
        </form>
        <a href="/admin/courses">Back to Courses List</a>
    </div>
</body>
</html>

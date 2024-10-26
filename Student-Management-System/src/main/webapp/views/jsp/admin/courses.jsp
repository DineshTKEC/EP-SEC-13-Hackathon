<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Courses</title>
    <style type="text/css">
        <%@ include file="/views/css/style.css"%>
    </style>
</head>
<body>
    <div class="container">
        <h1 class="heading">Course Management System</h1>
        <h2 class="heading">Manage Courses</h2>
        <a href="/admin/addCourse">Add New Course</a>
        <table>
            <tr>
                <th>Course No</th>
                <th>Course Name</th>
                <th>Start Date</th>
                <th>Duration (weeks)</th>
                <th>Instructor</th>
                <th>Actions</th>
            </tr>
            <c:forEach items="${courses}" var="course">
                <tr>
                    <td>${course.courseNo}</td>
                    <td>${course.courseName}</td>
                    <td>${course.startDate}</td>
                    <td>${course.duration}</td>
                    <td>${course.instructor != null ? course.instructor.name : 'Not Assigned'}</td>
                    <td>
                        <a href="/admin/editCourse/${course.courseNo}">Edit</a> |
                        <a href="/admin/deleteCourse/${course.courseNo}" onclick="return confirm('Are you sure you want to delete this course?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <a href="/admin">Back to Admin Dashboard</a>
    </div>
</body>
</html>

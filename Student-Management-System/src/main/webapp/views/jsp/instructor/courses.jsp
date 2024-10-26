<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Courses</title>
</head>
<body>
    <h1>My Courses</h1>
    <table>
        <tr>
            <th>Course No</th>
            <th>Course Name</th>
            <th>Start Date</th>
            <th>Duration (weeks)</th>
        </tr>
        <c:forEach items="${courses}" var="course">
            <tr>
                <td>${course.courseNo}</td>
                <td>${course.courseName}</td>
                <td>${course.startDate}</td>
                <td>${course.duration}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Display All Courses</title>
	
	<style type="text/css">
	<%@ include file="/views/css/style.css"%>
	
	table {
	  border-collapse: collapse;
	  width: 100%;
	}
	
	th, td {
	  border: 1px solid black;
	  padding: 10px;
	}
	
	th {
	  background-color: lightgray;
	}
	
	table tr:hover {
	  background-color: lightblue;
	}
	
	th, td {
	  font-size: 12px;
	  font-family: Arial, sans-serif;
	  font-weight: bold;
	}
	
	</style>
	
 <!-- 	<link rel="stylesheet" href="css/style.css" />  -->
</head>
<body>

	<div class="container">
		<h1 class="heading">Course Management System</h1>
		<ul class="nav">
			<li><a href="addCourse">Add New Course</a></li>
			<li><a href="/">Home</a></li>
		</ul>
		<h2 class="heading">Display All Courses</h2>
        <div class="add-form">
         <table>
                 <tr>
                    <th>Course No </th>
                    <th>Course Name </th>
                    <th>Start Date </th>
                    <th>Duration (weeks) </th>
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
         
         
       </div>
	</div>
</body>
</html>

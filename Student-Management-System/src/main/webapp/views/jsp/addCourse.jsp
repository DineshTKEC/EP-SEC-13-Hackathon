<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Register Course</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/style.css">
</head>
<body>

	<div class="container">
		<h1 class="heading">Course Management System</h1>
		<ul class="nav">
			<li><a href="viewAllCourses">Display All Courses</a></li>
			<li><a href="/">Home</a></li>
		</ul>
		<h2 class="heading">Register Course</h2>
        <div class="add-form">
          <form action="addCourse" method="post">
             <div class="form-group">
                    <label for="cno">Course No. :</label>
                    <input type="number" name="courseNo" class="input-field" id="cno" maxlength="10" value="1" required>
             </div>
             <div class="form-group">
                    <label for="cname">Course Name :</label>
                    <input type="text" name="courseName" class="input-field" id="cname" maxlength="40" value="Course Name" required>
             </div>
             <div class="form-group">
                    <label for="cstart">Start Date :</label>
                    <input type="date" name="startDate" class="input-field" id="cstart" value="2023-09-01" required>
             </div>
             <div class="form-group">
                    <label for="cduration">Duration (weeks) :</label>
                    <input type="number" name="duration" class="input-field" id="cduration" value="12" required>
             </div>
             <input type="submit" value="Add Course">
          </form>
       </div>
	</div>
	<div>${PrintSwal}</div>
</body>
</html>

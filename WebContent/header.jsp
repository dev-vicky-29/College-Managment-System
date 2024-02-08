<%@page import="com.util.db.DataAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%
	String errorMsg="";
    String successMsg="";
    DataAccess db=new DataAccess();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Department of Computer Science, Karad</title>
<link rel="icon" href="/College_Managment_System/images/TitleLogo.png" type="image/x-icon">
<link href="/College_Managment_System/css/bootstrap.css" rel="stylesheet"/>
<link href="/College_Managment_System/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/College_Managment_System/css/Style.css" rel="stylesheet"/>

<!-- Add this CSS code in the head section or in an external stylesheet -->
<style>
  label.error {
    color: red;
  }
</style>

</head>
<body>
<!-- Header Section -->
<header>
<div style="height:120px">
<div class="text-center">
<h6 class="text-danger">Shri Shivaji Education Society Karad's, Board For Higher Education's</h6>
</div>
<div class="Container text-center bg-danger">
<h1><span class="Header-Auto-Type"></span></h1>
</div>
<div class="d-flex justify-content-around">
<h6>Estd=1958</h6>
<h5 class="text-success">An ISO 9001:2015 Certified College</h5>
<h6>NAAC Reaccredited B<sup>++</sup></h6>
</div>
</div>
</header>
						<!-- Nav Bar Section -->
<nav class="navbar navbar-expand-lg bg-info" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">DOCS</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
      <%
      if(session.getAttribute("user")==null){
      %>
        <li class="nav-item">
          <a class="nav-link active" href="/College_Managment_System/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/College_Managment_System/about.jsp">About us</a>
            <a class="dropdown-item" href="/College_Managment_System/Facilities.jsp">Facilities</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/College_Managment_System/contact.jsp">Contact Us</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Academic</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/College_Managment_System/AcademicCalendar.jsp">Academic Calendar</a>
            <a class="dropdown-item" href="/College_Managment_System/courses.jsp">Courses</a>
            <a class="dropdown-item" href="/College_Managment_System/timetable.jsp">Time Table</a>
            <a class="dropdown-item" href="/College_Managment_System/syllabus.jsp">Syllabus</a>
            <a class="dropdown-item" href="/College_Managment_System/results.jsp">Results</a>
            <a class="dropdown-item" href="/College_Managment_System/StudentProgression.jsp">Student Progression</a>
            <a class="dropdown-item" href="/College_Managment_System/alumni.jsp">Alumni</a>
            </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Faculty</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/College_Managment_System/TeachingFaculty.jsp">Teaching Faculty</a>
            <a class="dropdown-item" href="/College_Managment_System/Non-TeachingFaculty.jsp">Non-Teaching Faculty</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Achievements</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/College_Managment_System/StudentAchievements.jsp">Student Achievements</a>
            <a class="dropdown-item" href="/College_Managment_System/TeacherAchievements.jsp">Teacher Achievements</a>
            <a class="dropdown-item" href="/College_Managment_System/research-staff.jsp">Research Publication</a>
            <a class="dropdown-item" href="/College_Managment_System/ResearchProjects.jsp">Research Projects</a>
            <a class="dropdown-item" href="/College_Managment_System/StudentProjects.jsp">Student Projects</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Activities</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/College_Managment_System/seminar.jsp">Science Seminar</a>
            <a class="dropdown-item" href="/College_Managment_System/LeadCollegeActivity.jsp">Lead College Activity</a>
            <a class="dropdown-item" href="/College_Managment_System/GuestLecture.jsp">Guest Lecture</a>
            <a class="dropdown-item" href="/College_Managment_System/OtherEvents.jsp">Other Events</a>
            <a class="dropdown-item" href="/College_Managment_System/placements.jsp">Placements</a>
            <a class="dropdown-item" href="/College_Managment_System/StudentProjects.jsp">MOU'S</a>
          </div>
        </li>
         <!-- Login & Sign Up -->
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Login</a>
          <div class="dropdown-menu">
          <a class="dropdown-item" href="/College_Managment_System/slogin.jsp">Student Login</a>
           <a class="dropdown-item" href="/College_Managment_System/tlogin.jsp">Teacher Login</a>
        </div>
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Sign Up</a>
          <div class="dropdown-menu">
          <a class="dropdown-item" href="/College_Managment_System/ssignup.jsp">Student SignUp</a>
           <a class="dropdown-item" href="/College_Managment_System/tsignup.jsp">Teacher SignUp</a>
        </div>
        <%
        	} else {
        		
      	%>
        <!-- Admin Related Navbar -->
        <li class="nav-item">
          <a class="nav-link active" href="Admin/admin.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="../about.jsp">About us</a>
            <a class="dropdown-item" href="Facilities.jsp">Facilities</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="contact.jsp">Contact Us</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Academic</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="AcademicCalendar.jsp">Academic Calendar</a>
            <a class="dropdown-item" href="courses.jsp">Courses</a>
            <a class="dropdown-item" href="timetable.jsp">Time Table</a>
            <a class="dropdown-item" href="syllabus.jsp">Syllabus</a>
            <a class="dropdown-item" href="results.jsp">Results</a>
            <a class="dropdown-item" href="StudentProgression.jsp">Student Progression</a>
            <a class="dropdown-item" href="alumni.jsp">Alumni</a>
            </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Faculty</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="TeachingFaculty.jsp">Teaching Faculty</a>
            <a class="dropdown-item" href="Non-TeachingFaculty.jsp">Non-Teaching Faculty</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Achievements</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="StudentAchievements.jsp">Student Achievements</a>
            <a class="dropdown-item" href="TeacherAchievements.jsp">Teacher Achievements</a>
            <a class="dropdown-item" href="research-staff.jsp">Research Publication</a>
            <a class="dropdown-item" href="ResearchProjects.jsp">Research Projects</a>
            <a class="dropdown-item" href="StudentProjects.jsp">Student Projects</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Activities</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="seminar.jsp">Science Seminar</a>
            <a class="dropdown-item" href="LeadCollegeActivity.jsp">Lead College Activity</a>
            <a class="dropdown-item" href="GuestLecture.jsp">Guest Lecture</a>
            <a class="dropdown-item" href="OtherEvents.jsp">Other Events</a>
            <a class="dropdown-item" href="placements.jsp">Placements</a>
            <a class="dropdown-item" href="StudentProjects.jsp">MOU'S</a>
          </div>
        </li>
        </ul>
		<!-- Admin NavBar After Login -->
			<div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  <a class="dropdown-item" href="/College_Managment_System/Admin/YourProfile.jsp">Your Profile</a>
  			   <a class="dropdown-item" href="/College_Managment_System/Admin/AddTeachingFaculty.jsp">Add Teaching Faculty</a>
  			   <a class="dropdown-item" href="/College_Managment_System/Admin/AddNonTeachingFaculty.jsp">Add Non-Teaching Faculty</a>
  			  <a class="dropdown-item" href="#">Add Student</a>
    		<a class="dropdown-item" href="GuestLecture.jsp">Guest Lecture</a>
   			 <a class="dropdown-item" href="OtherEvents.jsp">Other Events</a>
    		<a class="dropdown-item" href="placements.jsp">Placements</a>
    		<a class="dropdown-item" href="/College_Managment_System/Admin/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/College_Managment_System/Admin/logout.jsp">Logout</a>
 		 </div>
			</div>       
		 <%
        	}
        %>
  </div>
  </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://unpkg.com/typed.js@2.1.0/dist/typed.umd.js"></script>
<!-- Header Auto Type -->
<script>
var typed=new Typed(".Header-Auto-Type",{
	strings:["Department Of Computer Science, Karad"],
	typeSpeed: 150,
	backSpeed: 150,
	looped: true
})
</script>
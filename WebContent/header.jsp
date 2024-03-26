<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.db.DataAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%
    String  errorMsg="";
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
<div style="height:">
<div class="d-flex justify-content-center">
<img alt="Header" src="/College_Managment_System/images/header1.PNG">
</div>
<div class="Container text-center bg-danger">
<h1><span class="Header-Auto-Type"></span></h1>
</div>
</div>
</header>
						<!-- Nav Bar Section -->
<nav class="navbar navbar-expand-lg bg-info sticky-top" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">DOCS</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      
      <%
      if(session.getAttribute("user")==null){
      %>
      <ul class="navbar-nav me-auto">
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
            <a class="dropdown-item" href="/College_Managment_System/ResearchPublication.jsp">Research Publication</a>
            <a class="dropdown-item" href="/College_Managment_System/ResearchProjects.jsp">Research Projects</a>
            <a class="dropdown-item" href="/College_Managment_System/StudentProject.jsp">Student Projects</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Activities</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/College_Managment_System/Activities.jsp">Activities</a>
            <a class="dropdown-item" href="/College_Managment_System/placements.jsp">Placements</a>
            <a class="dropdown-item" href="/College_Managment_System/MOUs.jsp">MOU'S</a>
          </div>
        </li>
         <!-- Login & Sign Up -->
         <li class="nav-item float-end">
         <a class="nav-link text-white hover" href="/College_Managment_System/login.jsp">Login</a>
         </li>
         
        </ul>
        <%
        	} else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("admin")){
        		
      	%>
        <!-- Admin Related Navbar -->
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="/College_Managment_System/Admin/admin.jsp">Admin
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/College_Managment_System/Admin/about.jsp">About us</a>
            <a class="dropdown-item" href="/College_Managment_System/Admin/Facilities.jsp">Facilities</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/College_Managment_System/Admin/contact.jsp">Contact Us</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Academic</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/College_Managment_System/Admin/AcademicCalendar.jsp">Academic Calendar</a>
            <a class="dropdown-item" href="/College_Managment_System/Admin/courses.jsp">Courses</a>
            <a class="dropdown-item" href="/College_Managment_System/Admin/timetable.jsp">Time Table</a>
            <a class="dropdown-item" href="/College_Managment_System/Admin/syllabus.jsp">Syllabus</a>
            <a class="dropdown-item" href="/College_Managment_System/Admin/results.jsp">Results</a>
            <a class="dropdown-item" href="/College_Managment_System/Admin/StudentProgression.jsp">Student Progression</a>
            <a class="dropdown-item" href="/College_Managment_System/Admin/alumni.jsp">Alumni</a>
            </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Faculty</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/College_Managment_System/Admin/TeachingFaculty.jsp">Teaching Faculty</a>
            <a class="dropdown-item" href="/College_Managment_System/Admin/Non-TeachingFaculty.jsp">Non-Teaching Faculty</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Achievements</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/College_Managment_System/Admin/StudentAchievements.jsp">Student Achievements</a>
            <a class="dropdown-item" href="/College_Managment_System/Admin/TeacherAchievements.jsp">Teacher Achievements</a>
            <a class="dropdown-item" href="/College_Managment_System/Admin/ResearchPublication.jsp">Research Publication</a>
            <a class="dropdown-item" href="/College_Managment_System/Admin/ResearchProjects.jsp">Research Projects</a>
            <a class="dropdown-item" href="/College_Managment_System/Admin/StudentProject.jsp">Student Projects</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Activities</a>
          <div class="dropdown-menu">
           <a class="dropdown-item" href="/College_Managment_System/Admin/Activities.jsp">Activities</a> 
            <a class="dropdown-item" href="/College_Managment_System/Admin/Placements.jsp">Placements</a>
            <a class="dropdown-item" href="/College_Managment_System/Admin/MOUs.jsp">MOU'S</a>
          </div>
        </li>
        </ul>
		<!-- Admin NavBar After Login -->
			<div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  <a class="dropdown-item" href="/College_Managment_System/Admin/YourProfile.jsp">Your Profile</a>
  			   <a class="dropdown-item" href="/College_Managment_System/Admin/AddStudent.jsp">Add Student</a>
  			   <a class="dropdown-item" href="/College_Managment_System/Admin/AddTeacher.jsp">Add Teacher</a>
  			   <a class="dropdown-item" href="/College_Managment_System/Admin/AddAcademicCalendar.jsp">Add Academic Calendar</a>
  			  <a class="dropdown-item" href="/College_Managment_System/Admin/reportlist.jsp">Reports</a>
    		<a class="dropdown-item" href="/College_Managment_System/Admin/GuestLecture.jsp">Guest Lecture</a>
   			 <a class="dropdown-item" href="/College_Managment_System/Admin/OtherEvents.jsp">Other Events</a>
    		<a class="dropdown-item" href="/College_Managment_System/Admin/placements.jsp">Placements</a>
    		<a class="dropdown-item" href="/College_Managment_System/Admin/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/College_Managment_System/Admin/logout.jsp">Logout</a>
 		 </div>
			</div>       
		 <%
        	} else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("teacher")){
        		
        %>
        
        <!-- Teacher Related navbar -->
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="/College_Managment_System/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/College_Managment_System/Teacher/about.jsp">About us</a>
            <a class="dropdown-item" href="/College_Managment_System/Teacher/Facilities.jsp">Facilities</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/College_Managment_System/Teacher/contact.jsp">Contact Us</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Academic</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/College_Managment_System/Teacher/AcademicCalendar.jsp">Academic Calendar</a>
            <a class="dropdown-item" href="/College_Managment_System/Teacher/courses.jsp">Courses</a>
            <a class="dropdown-item" href="/College_Managment_System/Teacher/timetable.jsp">Time Table</a>
            <a class="dropdown-item" href="/College_Managment_System/Teacher/syllabus.jsp">Syllabus</a>
            <a class="dropdown-item" href="/College_Managment_System/Teacher/results.jsp">Results</a>
            <a class="dropdown-item" href="/College_Managment_System/Teacher/StudentProgression.jsp">Student Progression</a>
            <a class="dropdown-item" href="/College_Managment_System/Teacher/alumni.jsp">Alumni</a>
            </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Faculty</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/College_Managment_System/Teacher/TeachingFaculty.jsp">Teaching Faculty</a>
            <a class="dropdown-item" href="/College_Managment_System/Teacher/Non-TeachingFaculty.jsp">Non-Teaching Faculty</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Achievements</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/College_Managment_System/Teacher/StudentAchievements.jsp">Student Achievements</a>
            <a class="dropdown-item" href="/College_Managment_System/Teacher/TeacherAchievements.jsp">Teacher Achievements</a>
            <a class="dropdown-item" href="/College_Managment_System/Teacher/ResearchPublication.jsp">Research Publication</a>
            <a class="dropdown-item" href="/College_Managment_System/Teacher/ResearchProjects.jsp">Research Projects</a>
            <a class="dropdown-item" href="/College_Managment_System/Teacher/StudentProject.jsp">Student Projects</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Activities</a>
          <div class="dropdown-menu">
           <a class="dropdown-item" href="/College_Managment_System/Teacher/Activities.jsp">Activities</a> 
            <a class="dropdown-item" href="/College_Managment_System/Teacher/Placements.jsp">Placements</a>
            <a class="dropdown-item" href="/College_Managment_System/Teacher/MOUs.jsp">MOU'S</a>
          </div>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Teacher Zone</a>
          <div class="dropdown-menu">
           <a class="dropdown-item" href="/College_Managment_System/Teacher/Notes.jsp">Notes</a> 
            <a class="dropdown-item" href="/College_Managment_System/Teacher/ImpLinks.jsp">IMP Link's</a>
            
          </div>
        </li>
        
        </ul>
        
<!-- Teacher NavBar After Login -->
			<div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  <a class="dropdown-item" href="/College_Managment_System/Teacher/YourProfile.jsp">Your Profile</a>
    		<a class="dropdown-item" href="/College_Managment_System/Teacher/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/College_Managment_System/Teacher/logout.jsp">Logout</a>
 		 </div>
			</div>

        
        <%
        	}else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("student")){
        		
        	
        %>
        
        <!-- Student Realated Navbar -->
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="/College_Managment_System/Student/student.jsp">Student
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/College_Managment_System/Student/about.jsp">About us</a>
            <a class="dropdown-item" href="/College_Managment_System/Student/Facilities.jsp">Facilities</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/College_Managment_System/Student/contact.jsp">Contact Us</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Academic</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/College_Managment_System/Student/AcademicCalendar.jsp">Academic Calendar</a>
            <a class="dropdown-item" href="/College_Managment_System/Student/courses.jsp">Courses</a>
            <a class="dropdown-item" href="/College_Managment_System/Student/timetable.jsp">Time Table</a>
            <a class="dropdown-item" href="/College_Managment_System/Student/syllabus.jsp">Syllabus</a>
            <a class="dropdown-item" href="/College_Managment_System/Student/results.jsp">Results</a>
            <a class="dropdown-item" href="/College_Managment_System/Student/StudentProgression.jsp">Student Progression</a>
            <a class="dropdown-item" href="/College_Managment_System/Student/alumni.jsp">Alumni</a>
            </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Faculty</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/College_Managment_System/Student/TeachingFaculty.jsp">Teaching Faculty</a>
            <a class="dropdown-item" href="/College_Managment_System/Student/Non-TeachingFaculty.jsp">Non-Teaching Faculty</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Achievements</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/College_Managment_System/Student/StudentAchievements.jsp">Student Achievements</a>
            <a class="dropdown-item" href="/College_Managment_System/Student/TeacherAchievements.jsp">Teacher Achievements</a>
            <a class="dropdown-item" href="/College_Managment_System/Student/ResearchPublication.jsp">Research Publication</a>
            <a class="dropdown-item" href="/College_Managment_System/Student/ResearchProjects.jsp">Research Projects</a>
            <a class="dropdown-item" href="/College_Managment_System/Student/StudentProject.jsp">Student Projects</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Activities</a>
          <div class="dropdown-menu">
             <a class="dropdown-item" href="/College_Managment_System/Student/Activities.jsp">Activities</a> 
            <a class="dropdown-item" href="/College_Managment_System/Student/Placements.jsp">Placements</a>
            <a class="dropdown-item" href="/College_Managment_System/Student/MOUs.jsp">MOU'S</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Student Zone</a>
          <div class="dropdown-menu">
           <a class="dropdown-item" href="/College_Managment_System/Student/Notes.jsp">Notes</a> 
            <a class="dropdown-item" href="/College_Managment_System/Student/ImpLinks.jsp">IMP Link's</a>
            
          </div>
        </li>
        
        </ul>
        
        <!-- Student NavBar After Login -->
			<div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  <a class="dropdown-item" href="/College_Managment_System/Student/YourProfile.jsp">Your Profile</a>
    		<a class="dropdown-item" href="/College_Managment_System/Student/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/College_Managment_System/Student/logout.jsp">Logout</a>
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
<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<h1>Admin Dashboard</h1>

<!-- Admin Index Page Specific Contents -->
<br><br>
<div class=" ">
<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="/College_Managment_System/images/college_photo.jpeg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>Some representative placeholder content for the first slide.</p>
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="/College_Managment_System/images/Department.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Some representative placeholder content for the second slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/College_Managment_System/images/college_photo_2.jpeg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Some representative placeholder content for the third slide.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>



<br><br>

<!-- This is Announcement Event,Notice Section  -->
<hr>
<div class="d-flex justify-content-evenly">


<div class="card border-primary mb-4" style="width: 500px; height:300px">
  <div class="card-header d-flex justify-content-between align-items-center">
    <span>Event</span>
    <a class="btn btn-primary" href="/College_Managment_System/Admin/AddEvent.jsp">Add Event</a>
  </div>
<marquee behavior="scroll" direction="up" scrollamount="2" vspace="1%" onmouseover="this.stop()" onmouseout="this.start()">
  <div class="card-body">
    <% ResultSet rs = db.getRows("select * from event"); 
    while (rs.next()) { 
    %>
    <p class="card-text">
      <img src="/College_Managment_System/images/new.gif" alt="Animated GIF" style="height: 50px; width: 50px; margin-right: 10px;">
      <%= rs.getString(2) %>
      <a href="<%= rs.getString(3) %>">Event</a>
    </p>
    <% } %>
  </div>
  </marquee>
</div>



<div class="card border-primary mb-4" style="width: 500px; height:300px">
  <div class="card-header d-flex justify-content-between align-items-center">
    <span>Notice & Announcement</span>
    <a class="btn btn-primary" href="/College_Managment_System/Admin/AddNotice.jsp">Add Notice</a>
  </div>
  <marquee behavior="scroll" direction="up" scrollamount="2" vspace="1%" onmouseover="this.stop()" onmouseout="this.start()">
  <div class="card-body">
    <%
    ResultSet as=db.getRows("select * from notice");
    while(as.next()){
    %>
    <p class="card-text">
      <!-- Add marquee tag here -->
      
        <img src="/College_Managment_System/images/new.gif" alt="Animated GIF" style="height: 50px; width: 50px; margin-right: 10px;">
        <%=as.getString(2)%>
        <a href="<%=as.getString(3)%>">Notice</a>
      
    </p>
     <%
      }
      %>
  </div>
  </marquee>
</div>



</div>
<hr>



<%@ include file="../footer.jsp"%>
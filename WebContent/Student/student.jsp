<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>


<!-- Index Page Specific Contents -->

<!-- Carousel Start -->
<style>
.carousel-item {
	height:700px;
}

</style>

<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/College_Managment_System/images/college_photo.jpeg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/College_Managment_System/images/Department.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/College_Managment_System/images/college_photo_2.jpeg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<!-- Carousel End -->

<br>

<!-- This is Announcement Event,Notice Section  -->
<hr>
<div class="d-flex justify-content-evenly">


<div class="card border-primary mb-4" style="width: 500px; height:300px">
  <div class="card-header d-flex justify-content-between align-items-center">
    <span>Event</span>
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
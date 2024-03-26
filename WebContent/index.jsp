<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>
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

<!-- This is Announcement Event, Notice Section -->
<hr>

<h3 class="text-center text-warning">Announcement Event, Notice Section</h3>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6">
            <div class="card border-primary mb-4 h-100">
                <div class="card-header d-flex justify-content-between align-items-center bg-primary text-white">
                    <h5 class="m-0">Events</h5>
                </div>
                <div class="card-body">
                    <marquee behavior="scroll" direction="up" scrollamount="2" vspace="1%" onmouseover="this.stop()" onmouseout="this.start()">
                        <% ResultSet rs = db.getRows("select * from event");
                        while (rs.next()) { %>
                        <p class="card-text">
                            <img src="/College_Managment_System/images/new.gif" alt="Animated GIF" style="height: 30px; width: 30px; margin-right: 10px;">
                            <%= rs.getString(2) %>
                            <a href="<%= rs.getString(3) %>" class="btn btn-sm btn-outline-primary">Event Details</a>
                        </p>
                        <% } %>
                    </marquee>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card border-primary mb-4 h-100">
                <div class="card-header d-flex justify-content-between align-items-center bg-primary text-white">
                    <h5 class="m-0">Notices & Announcements</h5>
                </div>
                <div class="card-body">
                    <marquee behavior="scroll" direction="up" scrollamount="2" vspace="1%" onmouseover="this.stop()" onmouseout="this.start()">
                        <%
                        ResultSet as=db.getRows("select * from notice");
                        while(as.next()){
                        %>
                        <p class="card-text">
                            <img src="/College_Managment_System/images/new.gif" alt="Animated GIF" style="height: 30px; width: 30px; margin-right: 10px;">
                            <%=as.getString(2)%>
                            <a href="<%=as.getString(3)%>" class="btn btn-sm btn-outline-primary">Notice Details</a>
                        </p>
                        <%
                        }
                        %>
                    </marquee>
                </div>
            </div>
        </div>
    </div>
</div>

<hr>


<!-- About Deaprtment Start -->
 <div class="container mt-5">
    <div class="row">
        <div class="col-md-12 text-center mb-4">
            <h1 class="display-4 text-warning">Welcome to Computer Science Department of Karad</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 offset-md-3 text-center mb-4">
            <img src="/College_Managment_System/images/Department.jpg" alt="Department Image" class="img-fluid rounded">
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <p>The Department of Computer Science was established in the year 2008. The Department is committed to continuously improving the quality of education by enhancing the knowledge of students & faculty. With the increasing demand for computer science & technology in the development of software industries, the department has met the requirements with the latest computing machines and software.</p>
            <p>To train students with a strong theoretical foundation and practical knowledge, to imbibe professional ethics and managerial skills with commitment to society. The Department has always been on a high growth path and to keep pace with the current technological trends.</p>
            <p>Academic Programs offered by the department are B. Sc. (CS) Entire & B. Sc. (CS)(Optional). The undergraduate both courses in Computer Science were started in 2008. B. Sc. (CS) Entire course has an initial intake of 80 students & B.Sc. (CS)(Optional) 40 students, now we have an additional division of B. Sc. (CS) Entire with 192 students. And for B.Sc. (CS)(Optional) have 80 students.</p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 text-center">
            <a type="button" class="btn btn-primary" href="/College_Managment_System/about.jsp">Read More</a>
        </div>
    </div>
</div>




    
    <!-- About Department End -->
      <hr>
      
      <!-- Facilities Start -->


<div class="container mt-5">
    <div class="row">
        <div class="col-md-12 text-center">
            <h1 class="display-4 text-warning">Facilities Provided by Department</h1><br>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 ">
            <!-- Facilities -->
            <div class="row">
                <!-- Computer Labs -->
                <div class="col-md-4">
                    <div class="facility">
                        <h3><i class="fas fa-desktop"></i> Computer Labs</h3>
                        <p>The department provides well-equipped computer labs with the latest hardware and software.</p>
                    </div>
                </div>
                <!-- Clean Classrooms -->
                <div class="col-md-4">
                    <div class="facility">
                        <h3><i class="fas fa-spray-can"></i> Clean Classrooms</h3>
                        <p>We maintain clean and hygienic classrooms to provide a conducive learning environment.</p>
                    </div>
                </div>
                <!-- Printers for Students -->
                <div class="col-md-4">
                    <div class="facility">
                        <h3><i class="fas fa-print"></i> Printers for Students</h3>
                        <p>We offer printing facilities for students to support their academic needs.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Facilities End -->


<!-- Bootstrap JS and Font Awesome JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    
  
<%@ include file="footer.jsp"%>
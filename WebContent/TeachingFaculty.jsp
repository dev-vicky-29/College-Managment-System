<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>
<!--Viewer Side Teaching Faculties Page Specific Contents -->
	<div>
	<h2 class="text-center fw-bolder">Teaching Faculty</h2>
	</div>
<!-- Teacher Cards -->
<div class="row row-cols-1 row-cols-md-3 g-4">
<%
    ResultSet rs=db.getRows("select * from teachingfaculty");
    while(rs.next()){
    %>
	<div class="col">
  <div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="/College_Managment_System/FacultyFiles/<%=rs.getString(6)%>" class="img-fluid rounded-start" alt="...">
    </div>
    <div class="col-md-8">
     <h3 class="card-header"><%=rs.getString(1) %></h3>
      <div class="card-body">
        <h5 class="card-title"><%=rs.getString(2) %></h5>
        <p class="card-text"><%=rs.getString(3) %></p>
        <p class="card-text"><small class="text-body-secondary"><%=rs.getString(4) %></small></p>
         <div class="card-footer bg-transparent border-success">
        	<a href="<%=rs.getString(5) %>" class="btn btn-info">LinkedIn</a> <!-- https://www.linkedin.com/in/ rs.getString(5) -->
      		<a href="/College_Managment_System/FacultyFiles/<%=rs.getString(7)%>" class="btn btn-info">Resume</a>
      	</div>	 
      </div>
    </div>
  </div>
 
</div> 
</div>

 <%
      }
      %>
 </div>



<%@ include file="footer.jsp"%>

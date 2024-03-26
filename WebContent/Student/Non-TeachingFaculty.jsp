<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<!-- Admin Side Non-Teaching Faculties Page Specific Contents -->

	<div>
	<h2 class="text-center fw-bolder">Non-Teaching Faculty</h2>
	</div>

<div class="row row-cols-1 row-cols-md-3 g-4">
  <%
    ResultSet rs=db.getRows("select * from nonteachingfaculty");
    while(rs.next()){
    %>
    <div class="col">
  <div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="/College_Managment_System/NonTeachingFacultyFiles/<%=rs.getString(4)%>" class="img-fluid rounded-start" alt="...">
    </div>
    <div class="col-md-8">
     <h3 class="card-header"><%=rs.getString(1)%></h3>
      <div class="card-body">
        <h5 class="card-title"><%=rs.getString(2)%></h5>
        <p class="card-text"><%=rs.getString(3)%></p>
      </div>
    </div>
  </div>
</div>
</div>
  <%
      }
      %>
  
</div>
<%@ include file="../footer.jsp"%>

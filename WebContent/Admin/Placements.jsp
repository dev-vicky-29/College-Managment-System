<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>
<div class="container">
<h3 class="text-center">Add Students Placement's</h3>
<div class="text-center">
<a type="button" class="btn btn-primary btn-lg " href="/College_Managment_System/Admin/AddPlacements.jsp">Click Here</a>
</div>
</div>
<hr><br>
<div class="row row-cols-1 row-cols-md-3 g-4">
    <% 
    ResultSet rs = db.getRows("SELECT * FROM placement");
    while(rs.next()) {
    %>
    <div class="col">
    <div class="card mb-3 h-10">
        <h3 class="card-header"><%= rs.getString("CompanyName") %></h3>
        <div class="card-body">
            <h5 class="card-title"><%= rs.getString("JobTitle") %></h5>
            <h6 class="card-subtitle text-muted"><%= rs.getString("PlacementYear") %></h6>
        </div>
        <img src="/College_Managment_System/StudentPhotos/<%= rs.getString("StudentPhoto") %>" class="card-img-top" alt="Student Photo">
        <div class="card-body">
            <p class="card-text">Student Name: <%= rs.getString("StudentName") %></p>
            <p class="card-text">Salary: <%= rs.getString("Salary") %></p>
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item">Batch Year: <%= rs.getString("BatchYear") %></li>
            <li class="list-group-item">Placement Type: <%= rs.getString("PlacementType") %></li>
            <li class="list-group-item">Job Location: <%= rs.getString("JobLocation") %></li>
        </ul>
        <div class="card-body">
            <a href="<%= rs.getString("LinkedInLink") %>" class="card-link">LinkedIn</a>
            
        </div>
        <div class="card-footer text-muted">
           Placement Year: <%= rs.getString("PlacementYear") %>
        </div>
    </div>
    </div>
    <% 
    }
    %>
</div>

<%@ include file="../footer.jsp" %>

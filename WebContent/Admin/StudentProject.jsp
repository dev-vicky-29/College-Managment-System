<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<!-- View Student Projects Page Specific Contents -->
<br><hr>
<div class="container">
    <h3 class="text-center">View Student Projects</h3>
    <div class="text-center">
        <a type="button" class="btn btn-primary btn-lg" href="/College_Managment_System/Admin/AddStudentProject.jsp">Add New Project</a>
    </div>
</div>
<hr>
<div class="col-10 offset-1">
    <br/>
    <h1>Student Projects:</h1>
    <table id="projectTable" class="table table-bordered">
        <thead class="table-dark">
            <tr class="bg-primary">
                <th>Sr.No</th>
                <th>Project Name</th>
                <th>Student Name</th>
                <th>Project Partner Name</th>
                <th>Description</th>
                <th>Mentor</th>
                <th>Year</th>
                <th>File</th>
            </tr>
        </thead>
        <tbody>
            <% 
                ResultSet rs = db.getRows("SELECT * FROM StudentProjects");
                while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("ID") %></td>
                <td><%= rs.getString("ProjectName") %></td>
                <td><%= rs.getString("StudentName") %></td>
                <td><%= rs.getString("PartnerName") %></td>
                <td><%= rs.getString("Description") %></td>
                <td><%= rs.getString("Mentor") %></td>
                <td><%= rs.getString("Year") %></td>
                <td>
                    <a href="/College_Managment_System/ProjectFiles/<%= rs.getString("File") %>" class="btn btn-info" target="_blank">View</a>
                </td>
            </tr>
            <% 
                }
            %>
        </tbody>
    </table>
</div>
<%@ include file="../footer.jsp"%>
<script>
    $(function(){
        $("#projectTable").DataTable(); // Apply DataTable library on Table whose ID is projectTable
    });
</script>

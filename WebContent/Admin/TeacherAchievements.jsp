<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<!-- Teacher Achievements Page Specific Contents -->
<br><hr>
<div class="container">
<h3 class="text-center">Add Teacher Achievements</h3>
<div class="text-center">
<a type="button" class="btn btn-primary btn-lg " href="/College_Managment_System/Admin/AddTeacherAchievements.jsp">Click Here</a>
</div>
</div>

<hr>
<div class="col-10 offset-1">
    <br/>
    <h1>Teacher Achievements:</h1>
    <table id="table1" class="table table-bordered">
        <thead class="table-dark">
        <tr class="bg-primary">
        <!-- Sr.No	Name	Date	Type	Title	Description	Report -->
       	 <th>Sr.No.</th>
            <th>Name</th>
            <th>Date</th>
            <th>Type</th>
            <th>Title</th>
            <th>Description</th>
             <th>Report</th>
        </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs = db.getRows("SELECT * FROM teachersachievements");
        while(rs.next()){
        %>
        <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td><%= rs.getString(5) %></td>
            <td><%= rs.getString(6) %></td>
            <td><a href="/College_Managment_System/PDFFILES/<%=rs.getString(7)%>" class="btn btn-info">View</a></td>
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
        $("#table1").DataTable(); // Apply DataTable library on Table whose ID is table1
    });
</script>


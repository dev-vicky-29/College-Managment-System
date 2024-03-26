<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<!-- View Activities Page Specific Contents -->
<br>
<div class="col-10 offset-1">
    <br/>
    <h1>Activities:</h1>
    <table id="activityTable" class="table table-bordered">
        <thead class="table-dark">
            <tr class="bg-primary">
                <th>Sr.No</th>
                <th>Date</th>
                <th>Activity Type</th>
                <th>Level</th>
                <th>Title</th>
                <th>No. of Student Benifitted</th>
                <th>PDF</th>
            </tr>
        </thead>
        <tbody>
            <% 
                ResultSet rs = db.getRows("SELECT * FROM activities");
                while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("ID") %></td>
                <td><%= rs.getString("Date") %></td>
                <td><%= rs.getString("ActivityType") %></td>
                <td><%= rs.getString("Level") %></td>
                <td><%= rs.getString("Title") %></td>
                <td><%= rs.getString("Students") %></td>
                <td>
                    <a href="/College_Managment_System/PDFFILES/<%= rs.getString("PDF") %>" class="btn btn-info" target="_blank">View</a>
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
        $("#activityTable").DataTable(); // Apply DataTable library on Table whose ID is activityTable
    });
</script>

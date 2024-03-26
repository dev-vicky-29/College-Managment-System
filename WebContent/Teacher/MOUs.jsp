<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<!-- View MOUs Page Specific Contents -->
<br>
<div class="col-10 offset-1">
    <br/>
    <h1>MOUs:</h1>
    <table id="mouTable" class="table table-bordered">
        <thead class="table-dark">
            <tr class="bg-primary">
                <th>Sr.No</th>
                <th>Type</th>
                <th>Year</th>
                <th>Agency Name</th>
                <th>File</th>
            </tr>
        </thead>
        <tbody>
            <% 
                ResultSet rs = db.getRows("SELECT * FROM MOUs");
                while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("ID") %></td>
                <td><%= rs.getString("Type") %></td>
                <td><%= rs.getString("Year") %></td>
                <td><%= rs.getString("AgencyName") %></td>
                <td>
                    <a href="/College_Managment_System/PDFFILES/<%= rs.getString("File") %>" class="btn btn-info" target="_blank">View</a>
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
        $("#mouTable").DataTable(); // Apply DataTable library on Table whose ID is mouTable
    });
</script>

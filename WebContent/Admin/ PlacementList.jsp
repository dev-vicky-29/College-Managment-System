<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("eid")!=null){
    db.executeSql("DELETE FROM placement WHERE ID=?", request.getParameter("eid"));
}
%>

<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/Placements.jsp">Back</a>
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/AddPlacements.jsp">Add Placement</a>
</div>
<div class="col-10 offset-1">
    <br/>
    <h1>Placement List:</h1>
    <table id="placementTable" class="table table-bordered">
        <thead class="table-dark">
            <tr class="bg-primary">
                <th>Sr.No.</th>
                <th>Student Name</th>
                <th>Batch Year</th>
                <th>Company Name</th>
                <th>Job Title</th>
                <th>Placement Year</th>
                <th>Salary</th>
                <th>Placement Type</th>
                <th>Job Location</th>
                <th>LinkedIn Link</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <% 
            ResultSet rs = db.getRows("SELECT * FROM placement");
            while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("ID") %></td>
                <td><%= rs.getString("StudentName") %></td>
                <td><%= rs.getString("BatchYear") %></td>
                <td><%= rs.getString("CompanyName") %></td>
                <td><%= rs.getString("JobTitle") %></td>
                <td><%= rs.getString("PlacementYear") %></td>
                <td><%= rs.getString("Salary") %></td>
                <td><%= rs.getString("PlacementType") %></td>
                <td><%= rs.getString("JobLocation") %></td>
                <td><%= rs.getString("LinkedInLink") %></td>
                <td class="d-flex text-center">
                    <a href="?eid=<%= rs.getString("ID") %>" onclick="return confirm('Do you want to delete this record?');" class="btn btn-danger">Delete</a>
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
        $("#placementTable").DataTable(); // Apply DataTable library on Table whose ID is placementTable
    });
</script>

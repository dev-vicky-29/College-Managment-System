<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("eid")!=null){
    db.executeSql("DELETE FROM MOUs WHERE ID=?", request.getParameter("eid"));
}
%>

<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/MOUs.jsp">Back</a>
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/AddMOUs.jsp">Add MOU</a>
</div>
<div class="col-10 offset-1">
    <br/>
    <h1>MOUs List:</h1>
    <table id="mouTable" class="table table-bordered">
        <thead class="table-dark">
            <tr class="bg-primary">
                <th>Sr.No.</th>
                <th>Type</th>
                <th>Year</th>
                <th>Agency Name</th>
                <th>File</th>
                <th>Delete</th>
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
        $("#mouTable").DataTable(); // Apply DataTable library on Table whose ID is mouTable
    });
</script>

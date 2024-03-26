<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
    if (request.getParameter("eid") != null) {
        db.executeSql("DELETE FROM studentprojects WHERE ID=?", request.getParameter("eid"));
    }
%>

<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/College_Managment_System/Admin/AddStudentProject.jsp">Add Student Project</a>
</div>

<div class="col-10 offset-1">
    <br/>
    <h1>Student Projects:</h1>
    <table id="projectTable" class="table table-bordered">
        <thead class="table-dark">
            <tr class="bg-primary">
                <th>ID</th>
                <th>Project Name</th>
                <th>Student Name</th>
                <th>Partner Name</th>
                <th>Description</th>
                <th>Mentor</th>
                <th>Year</th>
                <th>File</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <% 
                ResultSet rs = db.getRows("SELECT * FROM studentprojects");
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
        $("#projectTable").DataTable(); // Apply DataTable library on Table whose ID is projectTable
    });
</script>
